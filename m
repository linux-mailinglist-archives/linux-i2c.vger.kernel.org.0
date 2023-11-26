Return-Path: <linux-i2c+bounces-461-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F00677F9509
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Nov 2023 20:26:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7A0EEB20ADF
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Nov 2023 19:26:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7FA011C93;
	Sun, 26 Nov 2023 19:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QViOPYEQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68FCF10958
	for <linux-i2c@vger.kernel.org>; Sun, 26 Nov 2023 19:26:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B39F4C433C7;
	Sun, 26 Nov 2023 19:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701026805;
	bh=QSwTlby3xKLDK6tUg4C22G4VVlEBOutaHdGhGMCFa4M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QViOPYEQ/u1WfBYUxlHMMCJfg0qKgYHq35eFibgeh5l+ddz4BpEWXD2w6KSHFe1FM
	 eZyX6ICYDpI7ouubmwjSpGfPk6nAIENbm0qpqnqIPkriDKO6UIjGiEeHCdKlvWLFuD
	 IFJrGuaz7nskjMk7PrxdZwv1sUgaLJkpwoclcxsZZPsHJrY/+/1XwAKlU8GGoKHjfD
	 ExiYbbll9/fqL0RvMCmozvo85ePfH5HP+MgTp0OwRuql9A2/ZNiOWT1jKM+S04Egz8
	 cwCoOP3iMaLqV2etnn3xCU9vmj/BsN8Uim9PNq87r7t4oVlCzG3jkA7bFl6JHxYwVN
	 Eokw6/+29HjLQ==
Date: Sun, 26 Nov 2023 20:26:40 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Robert Hancock <robert.hancock@calian.com>
Cc: "michal.simek@amd.com" <michal.simek@amd.com>,
	"ben-linux@fluff.org" <ben-linux@fluff.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v2 0/2] Xilinx I2C driver fixes
Message-ID: <20231126192640.hda7iaamh7dedavg@zenone.zhora.eu>
References: <20231121180855.1278717-1-robert.hancock@calian.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231121180855.1278717-1-robert.hancock@calian.com>

Hi,

On Tue, Nov 21, 2023 at 06:10:52PM +0000, Robert Hancock wrote:
> A couple of fixes for the Xilinx I2C driver.
> 
> Changed since v1:
> -Fixed an issue in first patch where an additional message could still have
> been written to the TX FIFO without waiting for it to empty.
> 
> Robert Hancock (2):
>   i2c: xiic: Wait for TX empty to avoid missed TX NAKs
>   i2c: xiic: Try re-initialization on bus busy timeout

Michal, any chance to take a look here?

Andi

