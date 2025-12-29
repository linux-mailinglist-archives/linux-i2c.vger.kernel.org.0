Return-Path: <linux-i2c+bounces-14812-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD25CE5AA8
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Dec 2025 02:22:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D7D2F3000DFF
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Dec 2025 01:22:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 344F721E0AF;
	Mon, 29 Dec 2025 01:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="GaxrQobz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC7221E082;
	Mon, 29 Dec 2025 01:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.19.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766971338; cv=none; b=H2qoagaNl/4a9MM9pYuqoZ2VaxAn+gtIrKEWXsz/d0hCzmCbQNAbDGt7t41rR1emcrlLjxUO87Ns1ADEArteMJxa5uOfhRQoVORBMIk5++3sNmI0b4S9DsMwKWrRCqeo936W3aCpXzSE5HeH2z9nDDsA8r9v7Kdasg1NN6LL3EA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766971338; c=relaxed/simple;
	bh=CTG3RA5dNu0tn6GzseubWUAP6yWeJnp/KpByxdOMMLw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MLXZnPEPHmsT2hpL4FtBeq1qAJyHE19izqGup/uAjxyi/zJ58tALlY/bIYvONYbyxbmNyIPcjm+fYF6k+Ku0kpiWRCe9VgBMob0CEtQsaktiWQaPJxe4705jm31CG9itzX0YmuN2PSIgzW9bHTCdqZAFDbGGrdOMj+cccwAWm5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=GaxrQobz; arc=none smtp.client-ip=54.207.19.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1766971265;
	bh=aGnIEv/VfEP+D5B2aIP/tXEv3CMUGWzK3F2vJ4iKjFo=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=GaxrQobzjj0QuFERK1btmGExE6jg3+RKxoOkfVVmJ7FRfSej/ycgOhoZp3D3wxWDc
	 UqNNpiNfOmgoujmDSz9OtXNjgHI5c+rgqBEexD9r5d0RLzJr5TWd1RgY6/Aq1wjwOo
	 R3yWrBrjbfr3fNkkxugvh8R91xwjQgx9ql+7gwGE=
X-QQ-mid: zesmtpgz4t1766971259teee092f5
X-QQ-Originating-IP: PKgYghdT8oi3a6sFLOe74HJmgNBRtvW503vk0OEHnps=
Received: from = ( [183.48.244.56])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 29 Dec 2025 09:20:57 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10468442197477288879
EX-QQ-RecipientCnt: 8
Date: Mon, 29 Dec 2025 09:20:57 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v5 3/3] i2c: spacemit: drop warning when clock-frequency
 property is absent
Message-ID: <E42FFF2530F73556+aVHXeY6PlQt40uY1@kernel.org>
References: <20251226-k1-i2c-ilcr-v5-0-b5807b7dd0e6@linux.spacemit.com>
 <20251226-k1-i2c-ilcr-v5-3-b5807b7dd0e6@linux.spacemit.com>
 <b09d6add-40d8-4deb-b63e-31adc9f327b1@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b09d6add-40d8-4deb-b63e-31adc9f327b1@riscstar.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NfykWmRlrd2ohhphnxX6ChVDp4TdAkCrjxT8zUVXJJWSXj/T2Hme8pJI
	HgEW6eaM4hMSwaiRrJbzhQKa9oarP0cmO5ZYNadUJ6jCqDqpIyUJ2chxVXT6txNQnWMNyid
	Y+RdWqZyCQmM1l5YCgkQRPjZNEzSCjwnFD9we3AHao0w7fijGm5eqwhYgbahBviVwu58oCg
	nBXJ+6j7NRCDJA0dcFqxFL6Br/kdtpirMeiZBhyM1ji+No+SEY1Z8X+DNQ/5xqgsr1FGCwO
	ovjpB2wIYKnJfsSRN6lm3eyoZlRC8Adcc3bW3lbllRgvJ16oWW6x+ZrX2uyGx5XGaXZJOGb
	foTXFjAHzM61mrsrvwBpobZYCTnS9BalfPCdQvJVQndsKtMMPkecHLCbMjJtA1fAJ93wA6d
	bshlKgbjL39RjCBjCSeb95VwhgaKJXSyAirar4CeASGPRFJ1eManlkVb7QyXnegcMQus/tP
	5evAj8Zw8f+vnxNKnDuLgEZHBTrkQhVF+qi9cS7PofnmyZtqa0i5a00GcGA3DSEKauo3DLs
	RVYsGcWXxnErcuuVSda/ztlT6xRGmAfTWnVnB2ju+AcARz8oS1Ife+OV7fOkyjnECXJxfIx
	FhkEWL/ArvFsyzmunFhtjTy+PCg/XY7XQPQKOI0wwvcYzzYgzzxFOjO7VhMeuEvDUTFQVyZ
	rzJhjoilRU9lcTuuBenL+j5DxuWbsjIT31581kOquSr4wVSpXJBODz1ZRrNqUWjff44g3+8
	m0kIFhqdnYBbGY31MCz/rzWiGQKK7sDL7DIe92W0/6CHKkyAbYgMjVlwBv5Hm5rZ+hnNqTe
	okYOz/tLAxTiw18KrNHXtG4laNjI5dpR/xaBpNaSWGnUge+v7Xq6SKo6icVyJKXzdLxKj96
	cPl/9lEZA6e3WmPG7xHylonCEdCQT74zwfTV9KGxrEd5f152MUSVC6EIrNujheA4d9JAnhp
	g2SR0bVOV85chuZpsXItMT48h1qONysWk7zXhPnALv86RoJAJigtfDYcYMtj2itMdmbo+2M
	GstpVblvxpepwIFqGlHUSo1caOSKV73E/3WGOezVeD92B0u6tX
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0

On Sun, Dec 28, 2025 at 06:56:38PM -0600, Alex Elder wrote:
> On 12/26/25 2:32 AM, Troy Mitchell wrote:
> > The clock-frequency property is optional according to the DT binding.
> > Do not emit a warning when the property is missing and fall back to the
> > default frequency instead.
> > 
> > Fixes: 5ea558473fa31 ("i2c: spacemit: add support for SpacemiT K1 SoC")
> > Suggested-by: Alex Elder <elder@riscstar.com>
> > Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> 
> Any error reading the "clock-frequency" property will simply leave
> i2c->clock_freq alone.  This is good.
> 
> But the lines that follow this issue a warning if i2c->clock_freq
> is 0.  If it's optional, you should simply use a default value,
> and although you could state that rate with dev_info(), you should
> not warn about it.
Thanks! I get your point!

              - Troy

