Return-Path: <linux-i2c+bounces-13274-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F21BA8924
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Sep 2025 11:17:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B772D3B4B5E
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Sep 2025 09:17:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C311F26CE34;
	Mon, 29 Sep 2025 09:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="KLhSDn6I"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27CA134BA41;
	Mon, 29 Sep 2025 09:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759137447; cv=none; b=DlKSWu0pzngtQ77AcJMDbp2qS5gwRiNTX3K2oww+awAzV/q5KFfGWNQv0TulSnVMwx36q6LD3BXWiLiDtwmpijoZfeMpFz84skB5Ii7Damb/N1HCJT3+X+6t3O/EY+Y+tBP9T3zkG3CzzqOlX+hUGqqXxmi33h4fvuuh2Ep8jmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759137447; c=relaxed/simple;
	bh=/2HVAoebRXSG/qyzO7c2YZJBhO9WQpiEPtLzVRoAaKc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZcfKSL8IEsgFV4SrlxH/csZOV/n3cb8ncVmcr7ys9Y2gj5SuUJ+EPQqiRUA4B7ok1mKOK8lCAfza8cguo33PuaeV5sBXgtKYIACT4kbleSuUWudADrOab3wYKLk8GMyVloKz4GoG7eMAqZfNrp0SacAhn/lu73zTPKC23yPnXE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=KLhSDn6I; arc=none smtp.client-ip=54.254.200.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1759137359;
	bh=KeVkegvpdMgh47tnqmI3xOua1lgqp1cz8RZNtr7UffM=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=KLhSDn6IBsZmWQtzF/f/Zsyev6LZxPqwUzOAXeDRh09r1/PnwZa7soxBpCGCAaK7h
	 DkM99ViR460i1OdO9ax2FYT2Xs0p5l7ZhmSk/+5aoGwYHbLrU6iKj9glFg+jQgQ8WD
	 ashLz5+bJNFNlfEQIIzdv+xo0/Z6Lht4PQyROGOs=
X-QQ-mid: zesmtpsz4t1759137350t17f23be7
X-QQ-Originating-IP: FVLep5dVBtmVD5DCpCmR0xTVH0ACm5Z5iCCpFlyvgyw=
Received: from = ( [14.123.252.176])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 29 Sep 2025 17:15:49 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 981246392991954728
EX-QQ-RecipientCnt: 9
Date: Mon, 29 Sep 2025 17:15:49 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troymitchell988@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH v3] i2c: spacemit: introduce pio for k1
Message-ID: <A6E9D3643EC66124+aNpORZx6yq8VOfd8@kernel.org>
References: <20250929-k1-i2c-atomic-v3-1-f7e660c138b6@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250929-k1-i2c-atomic-v3-1-f7e660c138b6@linux.spacemit.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: NJcWJJyfcVSIE+dZGnLUCuQBwYiiXz1dGQt5VB3R/aE04qlDSLZIAkQt
	YNnF67pY4NqjBJS7S1U58lSJ9l+OTKlyCzfmceYSbTL+mR4oq+3+rV/n8Kdu6TeQAeoB6jT
	A0/qviKULd3LHkGnIzkTm8WylPHCGbkvpP/R52bgQDCJSEhO1qqYWUgb13WGwWSTmUGlG5a
	SyL5XytTF6r+UBPzliJrvcW8Q9Ujn+kHQfa5xo1VgkhsBs/PBDgBmmehLKGxThxQxXqMeRj
	F7uPtBSykgJRqqnwMF8RqZu3CkAMHFFpyW2iCx2bTPoC+WIkTc19BXHH3ArRPkA4Chsh10d
	5kZbr9H/muJTLSbolyFwCxhQ2H7Izx+0Yc/ZizzXhhuUaDBiaKNb5KRS8wfYHAG61gJdfR4
	9hK1qrPNyd4PtKkktB5cRlLGUSbR2WerX4+OXZJr65JG78DgUWtHELkYnV/tlfw3PSPmpi6
	VEvU9a6RhpvJAYAmyXBEjiz11wyqJDpcktNw2HyQj0jkFetEhdGhsRJDJ95/c16V9xFKC8g
	TqjiMcGD11K4jprS1psn/oG3r/mtdFJj71zZqhXQnQEe8kAOyXCNJi15ly+vu8V20HRejNl
	ZPgpdJu/AVx9ca/7Cbmfe5Pm34CbWvdTrn3YE1SdQYDro5wrc6pT+rRYWiw6GXl1eZUSHRX
	oO+NcFa2gq3itmRV/8Zo2NiWy5mNdBLYPzHZt2+bLfwE9fOMz3zDWVPsI9Cxd00k9VXM2Y6
	Wa0qBx765KLSUI26Nmj7WZUlBPKVVmWuEyGQg7E6/ss6c/Qxp4irbhnRYY9rdvyVHbfOWWH
	GTkKjPchdiLJBHx86y5a/Z4AkMzp6BAGDWlHfFXUR9wQbfIBIgOZOQLK8ooeRlnuQztHnw7
	FR4YBn9CE+pRJu9Qm9QBxkriRvg4x/vwDjFKaBguBm5mGE4ZPeQ4ZGkzrlgi+zyQwnyHzyW
	kyeapqnKFWEoyPkpZDDHpRtImxtVatSrtZTKKrhDaLK4Zwfm4pLCbSD+U6IaYdMnRFvksRi
	ZOVN2IMhsrXb0RPwq9KkjlOFnLSAH2rGjyrPxMolXL7x5xbegKW9sioQPuaHYrUfRwHS3f/
	Aiib/X+kum9LJUmaM+8QoE=
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
X-QQ-RECHKSPAM: 0

On Mon, Sep 29, 2025 at 02:07:49PM +0800, Troy Mitchell wrote:
> This patch introduces I2C PIO functionality for the Spacemit K1 SoC,
> enabling the use of I2C in atomic context.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
> Changes in v3:
> - drop 1-5 patches (have been merged)
> - modify commit message
> - use readl_poll_timeout_atomic() in wait_pio_xfer()
> - use msecs_to_jiffies() when get PIO mode timeout value
> - factor out transfer state handling into spacemit_i2c_handle_state().
> - do not disable/enable the controller IRQ around PIO transfers.
> - consolidate spacemit_i2c_init() interrupt setup
> - rename is_pio -> use_pio
> - rename spacemit_i2c_xfer() -> spacemit_i2c_xfer_common()
> - rename spacemit_i2c_int_xfer() -> spacemit_i2c_xfer()
> - rename spacemit_i2c_pio_xfer() -> spacemit_i2c_pio_xfer_atomic()
> - call spacemit_i2c_err_check() in wait_pio_xfer() when write last byte
> - Link to v2: https://lore.kernel.org/r/20250925-k1-i2c-atomic-v2-0-46dc13311cda@linux.spacemit.com
> 
> Changes in v2:
> - Patch 1/6:
>   Patch 3/6:
>   Patch 4/6:
>     - nothing
> - Patch 2/6:
>   - remove is_pio judgement in irq_handler()
> - Patch 5/6:
>   - fix wrong comment
>   - In spacemit_i2c_conditionally_reset_bus(), once the condition is met inside the loop, it should
>     return directly instead of using break.
> - Patch 6/6:
>   - add is_pio judgement in irq_handler()
>   - use a fixed timeout value when PIO
>   - use readl_poll_timeout() in  spacemit_i2c_wait_bus_idle() when PIO
> 
> - Link to v1: https://lore.kernel.org/r/20250827-k1-i2c-atomic-v1-0-e59bea02d680@linux.spacemit.com
> ---
>  drivers/i2c/busses/i2c-k1.c | 206 ++++++++++++++++++++++++++++++++++----------
>  1 file changed, 161 insertions(+), 45 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
>  static int spacemit_i2c_xfer_msg(struct spacemit_i2c_dev *i2c)
>  {
>  	unsigned long time_left;
> @@ -310,10 +376,16 @@ static int spacemit_i2c_xfer_msg(struct spacemit_i2c_dev *i2c)
>  
>  		reinit_completion(&i2c->complete);
>  
> -		spacemit_i2c_start(i2c);
> +		if (i2c->use_pio) {
> +			spacemit_i2c_start(i2c);
> +
> +			time_left = spacemit_i2c_wait_pio_xfer(i2c);
> +		} else {
> +			spacemit_i2c_start(i2c);
I will put i2c_start() out in the next version.

                        - Troy

