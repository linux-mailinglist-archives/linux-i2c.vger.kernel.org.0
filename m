Return-Path: <linux-i2c+bounces-7464-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D7C9A311B
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Oct 2024 00:59:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A8D381F2107E
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Oct 2024 22:59:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 600211D95A9;
	Thu, 17 Oct 2024 22:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="mTGAjY7I"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-40138.protonmail.ch (mail-40138.protonmail.ch [185.70.40.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA141D86C9
	for <linux-i2c@vger.kernel.org>; Thu, 17 Oct 2024 22:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729205982; cv=none; b=m87/uKo/ATZ9U+Il28uY6AKqo79Hpqjll3DTv+VRXlzLWdq3jU7YQuBx8sl3kmlgIBNWS1CtJRvbkGPdLDqcdv6oWy30h1BiFyEEniSa8GFBdXBOcFoTuMiHNXkzvV59geGzuMDRs4LsDy3Uv2GmgS0w9gxTQAfn//xLYhwJ1C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729205982; c=relaxed/simple;
	bh=XSIYuRb8x6QcAapcROpsqjfCVYqkRckfkhFZTIteoi0=;
	h=Date:To:From:Subject:Message-ID:MIME-Version:Content-Type; b=k8EC9Ro5ViuX6kMXl5tUezLx9Eex+4BbU9zpyZnaVSuD7WwMfmnZkj6ASMGuyZxs01aqg4vANOSFm+dCtLlKMcexwwCFJkYqVmrIu++CF1RiSiB7FXlR2QS9NtfI8Ru8zW6ZcvPHgqyCwZ72iQXHU+BGCBIipVTMJ+uj/RgpOW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=mTGAjY7I; arc=none smtp.client-ip=185.70.40.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1729205978; x=1729465178;
	bh=XSIYuRb8x6QcAapcROpsqjfCVYqkRckfkhFZTIteoi0=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=mTGAjY7I3M88sqDNnFE9OP1bz6sc4EzSaup3g7irsPSCWzzEPiiTkIZuJzRKWGvHl
	 c3R2AHFk9pnbcROn2YNbwZbHrWWLDpMkBq/0vf2U9UzGkIkp9/9o2KGu1Wwl2rBd9u
	 Z3QzjvVmRLRWxiXdU+Ols3+5IoTVBH5dEzIN4gLpFHmDL6yV0P00FZVbVegC4XVeCg
	 kybeYPiA2ndYwLJTWNtIPUka30h0DKWKBYPxSQl8u8gXpT9jIuuCjDyEfEqcWwpzuR
	 QlVI5MOA+6VRkVqviDRUiCUTo0K4Ary0KnG2MKh2dXgpWMHxfXdJQkzNZfiEjnzZNm
	 QzcjFKrcbD/+g==
Date: Thu, 17 Oct 2024 22:59:34 +0000
To: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
From: pavan_tx <pavan_tx@protonmail.com>
Subject: kernel or user-space driver for MFi chips
Message-ID: <awTsXySZA0kyfkuH_mr9MSCQhwi04v8bCzYLSWuGfVvW832CdSukTDIfQxD08G2SolDERaogU3Wvrdq438uldnLxfLd_6_vNMg3xLO9WMSE=@protonmail.com>
Feedback-ID: 32598487:user:proton
X-Pm-Message-ID: 932f5ba1a257a2ee7555a003f4ee7b0387a3dc9d
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Apple MFi programs have this i2c based chipsets like MFI343S00176 which are=
 the authentication co-processor for MFi certified products.
On a Linux based system with this chipset, what would be preferred way to c=
ommunicate with the chip?=20
An I2C Linux device driver OR a user-space program that uses the I2C_CHARDE=
V interface /dev/i2c-X?

There are some quirks with the MFi chip that are (the details are in the da=
tasheet which isn't public but available on signing into the MFi program),
- Each read of register involves a write of the register address, then wait=
 for ACK, if a NAK is received then wait for 500uS, then try again.
Sending the I2C stop sequence & a start sequence before we perform the read=
. So, essentially, the read and writes are split up by a i2c stop-start.

- This quirk means, we cannot use the i2c_smbus_read_byte/_write kind of ro=
utines in the driver nor the i2c_transfer & involves usage of i2c_master_se=
nd & i2c_master_recv.
I have not identified a way to include a i2c stop & start in between the wr=
ite and read using i2c_smbus_* & i2c_transfer routines.

- It is also because of this quirk, i2c tools (i2cget & i2cset) do not work=
 out of box & involves a simpler program that does open/ioctl/read & write =
on the fd of /dev/i2c-0 interface.
Single byte register read get lucky, However, larger registers that read ce=
rtificates aren't successful using i2cget (which internally uses SMB like t=
ransactions).

Based on above observations, what is preferred way of communicating with th=
e chipset? An i2c peripheral device driver that uses i2c_master_send/_recv =
or a user-space program that does read/write on the i2c-X file-descriptor?

Thanks,
Pavan

