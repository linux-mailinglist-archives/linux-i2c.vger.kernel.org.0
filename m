Return-Path: <linux-i2c+bounces-818-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D3219813F5A
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Dec 2023 02:45:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F594283E66
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Dec 2023 01:45:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5DA8807;
	Fri, 15 Dec 2023 01:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FH+0aW1i"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF7B7EA;
	Fri, 15 Dec 2023 01:45:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B189C433C8;
	Fri, 15 Dec 2023 01:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702604708;
	bh=DHXxRklGa7FqMreUEnzq9tpUNw6e/U21hX/acHkDN4o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FH+0aW1i/MPE2ogPdf6OZsP2FWkBvGMIjq8LRGnHlJAlZSl7egpaLJlg1Mysb4LrX
	 y5om6lZRX4lhE31RmTGkMzWAryHwRuNDAxJTvqwgwkdIhOZzBNO915doYPHlHcOm56
	 LCmVK6jMRRPBheO9XGzI3wBLh1xFEZum5EPlPfddpuT8Mzwmzd1w3e881RQGj7RPtb
	 oOa7qheb9KcEixyApTN4jOFM4pnL/ENbHWO5f3T6iNLnVcuDZt0X56imK7rUl9dJ9I
	 hr19rWMmUZhFe2S2cb4UQy5i2Lu4Zo7Qss7F5FcMIYFVWe4lshj3GRdyHi017DznP9
	 PjXmLgXCu9CAA==
Date: Fri, 15 Dec 2023 02:45:05 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Quan Nguyen <quan@os.amperecomputing.com>
Cc: Brendan Higgins <brendan.higgins@linux.dev>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Wolfram Sang <wsa@kernel.org>,
	Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
	Guenter Roeck <linux@roeck-us.net>, linux-i2c@vger.kernel.org,
	openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Cosmo Chou <chou.cosmo@gmail.com>,
	Open Source Submission <patches@amperecomputing.com>,
	Phong Vo <phong@os.amperecomputing.com>,
	"Thang Q . Nguyen" <thang@os.amperecomputing.com>
Subject: Re: [PATCH v4 2/2] i2c: aspeed: Acknowledge Tx done with and without
 ACK irq late
Message-ID: <20231215014505.he6ozzxd5jnjgvol@zenone.zhora.eu>
References: <20231211102217.2436294-1-quan@os.amperecomputing.com>
 <20231211102217.2436294-3-quan@os.amperecomputing.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231211102217.2436294-3-quan@os.amperecomputing.com>

Hi Quan,

On Mon, Dec 11, 2023 at 05:22:17PM +0700, Quan Nguyen wrote:
> Commit 2be6b47211e1 ("i2c: aspeed: Acknowledge most interrupts early in
> interrupt handler") acknowledges most interrupts early before the slave
> irq handler is executed, except for the "Receive Done Interrupt status"
> which is acknowledged late in the interrupt.
> However, it has been observed that the early acknowledgment of "Transmit
> Done Interrupt Status" (with ACK or NACK) often causes the interrupt to
> be raised in READ REQUEST state, that shows the
> "Unexpected ACK on read request." complaint messages.
> 
> Assuming that the "Transmit Done" interrupt should only be acknowledged
> once it is truly processed, this commit fixes that issue by acknowledging
> interrupts for both ACK and NACK cases late in the interrupt handler.
> 
> Fixes: 2be6b47211e1 ("i2c: aspeed: Acknowledge most interrupts early in interrupt handler")
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

