Return-Path: <linux-i2c+bounces-706-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 380AB80B639
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Dec 2023 21:28:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B75361F2105F
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Dec 2023 20:28:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D18331A727;
	Sat,  9 Dec 2023 20:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PzxK6iBL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C2979D0
	for <linux-i2c@vger.kernel.org>; Sat,  9 Dec 2023 20:28:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDC43C433C8;
	Sat,  9 Dec 2023 20:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702153698;
	bh=rslBYi0BViswbTgH93m6HMfXVxguyYBllIpDJEbGmY8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PzxK6iBLgBu0UDJZ5PDebxoB2/rmQ9/0kO+w7tV/H/fCrrgYe1Ag+jo+7XrTon596
	 Xsp75wGvG91ldzPwNe8XC7BF0M9Y2ac27ZkjPozdeC1grIQVQpwclyg1xKHLz72rLb
	 OsPDi4flg4Dd63wZh5kOfS8Hq5E6alekoMGJZ9Aef2WzfqRR9z0UKQs+8RaDIveLQk
	 qpgSShjeZl0a8hNMDdE/JjmyzBVyuT0Hi57k2ngyCzbwI7H6+Gy/NMq3Rj7/L/gfus
	 +SGuJ3Zzg5VxmI1npvnQAXlTvzFq29Slgi/3xfK3hESpslB0u3TUsk3A1D/z9AeddD
	 ZPQ5WavzE6mFg==
Date: Sat, 9 Dec 2023 21:28:10 +0100
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
Subject: Re: [PATCH v3 1/2] i2c: aspeed: Handle the coalesced stop conditions
 with the start conditions.
Message-ID: <20231209202810.r7kkz2hlaonyibha@zenone.zhora.eu>
References: <20231208033142.1673232-1-quan@os.amperecomputing.com>
 <20231208033142.1673232-2-quan@os.amperecomputing.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231208033142.1673232-2-quan@os.amperecomputing.com>

Hi Quan,

On Fri, Dec 08, 2023 at 10:31:41AM +0700, Quan Nguyen wrote:
> Some masters may drive the transfers with low enough latency between
> the nak/stop phase of the current command and the start/address phase
> of the following command that the interrupts are coalesced by the
> time we process them.
> Handle the stop conditions before processing SLAVE_MATCH to fix the
> complaints that sometimes occur below.
> 
> "aspeed-i2c-bus 1e78a040.i2c-bus: irq handled != irq. Expected
> 0x00000086, but was 0x00000084"
> 
> Fixes: f9eb91350bb2 ("i2c: aspeed: added slave support for Aspeed I2C driver")
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

