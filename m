Return-Path: <linux-i2c+bounces-14777-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F32ACDE48D
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Dec 2025 04:25:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 639E4300980E
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Dec 2025 03:25:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FD9D2868A6;
	Fri, 26 Dec 2025 03:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="sU/QDOqR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12DDA1D5CC9;
	Fri, 26 Dec 2025 03:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766719534; cv=none; b=BPqpznMR0VrxGgQh5bvHVoOS9GHI82EapYp+mELHX84YpLz1escddFIF0D79SM5fElCDOeMFjJQ9IGt+Xn6pTk/5gTCJXR6YFKJcaZBwqSBxLevXQMLUOWJV8qfxiJP1YkZV/PPGJlrF3h+MBpKadKCf5lkDesBwoO1Aop5z7do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766719534; c=relaxed/simple;
	bh=vT94Sebf/F24mJKX1jIMYapY8TGEBYIjmkFk/wVs42g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F/RASEZ6zwAEhoEgcTGBM3bZ1+4DM3erRBjgmkRoMbA4oXWkZ7Py/6N7romKsBQBeY55da4u2v5/jBZ9mperVLGHxqIIMKWdKvmkr4Ui8CdxkGi/t2XC4LH/yrIXJ+xvmbtEQxfZJA7qJSH00V8vJPQ9I+QNXQRzjVwVWMDMQ8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=sU/QDOqR; arc=none smtp.client-ip=54.254.200.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1766719451;
	bh=ZGYixiNr7TgV4tXYZjkDv48ADHaDqX/RgfMC9wzd8ZM=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=sU/QDOqRCazu2lyhT2MEuClWm6+BErA5W7UFFI7KFf2cvYnN2UaMdAc3xZoy0snvc
	 HKTNPzvzCDWhSRbKXCJ2aA47OxGrVJdnQzs8rVqgJDwWUKcgR4af6FK/BtMyBkEHWO
	 NATVunk/JCCHsrUflFkxy8ekGCe9Bpc01V09k3Ow=
X-QQ-mid: zesmtpgz3t1766719449t6da0dbd5
X-QQ-Originating-IP: /spbIg54ayM0uf1VDTy00rI812ssEztteaeVpK8OAVs=
Received: from = ( [183.48.244.228])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 26 Dec 2025 11:24:07 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12943365269370993549
EX-QQ-RecipientCnt: 19
Date: Fri, 26 Dec 2025 11:24:07 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Encrow Thorne <jyc0019@gmail.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: Troy Mitchell <troymitchell988@gmail.com>,
	Guodong Xu <guodong@riscstar.com>, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] i2c: k1: add reset support
Message-ID: <7C70798E25DC7187+aU3_145f-0aK1tZi@kernel.org>
References: <20251219-i2c-reset-v2-0-ad201a602e74@gmail.com>
 <20251219-i2c-reset-v2-2-ad201a602e74@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219-i2c-reset-v2-2-ad201a602e74@gmail.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MEBSZfMfsfaMnpGWFzHTYuIEh/0ifa+2tFCC7ECIDxOKurc9x4XdtmF7
	C+bNMLikIxFT4XMakAHp+npOY0AGr+rvgi2GF+LjJrtiQqSJsGCa195JTY6rHgXG3LQo8wo
	sT6iBtrxr5+lbZFhFPcVq6nhf9wTUwURjD2wwD2AR0ObVGqDJP5hzycSFWPIwBenknsXhZs
	N0u4JfYxrQ+OVE+lkudDuh5ztB+8SUX8zAA+q4TufXHzdR/7LoAfqgV2/3IggSy9w2wtd81
	gXj827JuN8bBCFeiY4fCGGnLvXd1SMr7GXAuQmZNb9W6zJaG4i2/ZwFbBoQRinBKQ7vYvtK
	UHSJQrJQQTpLiIlfhMIR2XZTXYhe9Dk8d7+9ELxJQsQwc+Qkecel36pAdEL4buoE3gCQvlx
	t1ShaiE5j/upp1gHTPEdMSjU8b9Vea5NLv6cc9MD/AEzu85pOqmK5vxSRR7g158EBny14UC
	rpzMem3nX4UbCgMjbLacuxoTK0gl5VDq7GOIe/N27YVd5Vfy4Uw/7kLCyRlhEErG+D46OFT
	hJb4ArMaZ+Jr0pKltgP4Rdbl4eya/+/JErnykcyjA+GPYYXy3fvDjuVScZD0K14HLA1jSzZ
	wmGxKys5XUrPwSwSvS/xBmXJx+DulBmlaVsI0kOV5A7JcYkCN9guvaabZPBdWeJuEMrFuQQ
	52qcLLINjQz5cai56xyToTX13Zu+NVm8fM+Bm/WvXXKoePuJhqiuwJnQywCrHSg0RKDQRCX
	MdIkV5bpCfkLsaGZtNBr/lzS14CLFArYdVmJirabEsA8coeeP3imJqc4yD+du7roOmUgVSG
	0vdZFd0P1zVd9jtuwsAwzIziLyN3ug6+yi6aCbfENdSmaYBYqgRgWWAKF9VnI9Bdc5Wqrru
	2+fNlOJnFqW79+aIQ/VS5s82wvM1GiFshTNImANt4GCa7WudAcFI+VTLrBxLyNgMqBeF+96
	9QW6MtIaCmIqzG36/15V5Q6weVTJ8+PzqXPeNP9P3YJX1zTQfA4ZJPA2NfDWtMPtBVS5dMY
	dete6twKDitQLwSPVh0Cn3zKrZQq0FTe1LpLNWPLP0DKmN8IwAcvggGiCbJwDZ6Hb/YOUdQ
	6gz1TWEZOF1mBaswcsLyKw=
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0

On Fri, Dec 19, 2025 at 03:42:21PM +0800, Encrow Thorne wrote:
> The K1 I2C controller provides a reset line that needs to be deasserted
> before the controller can be accessed.
> 
> Add reset support to the driver to ensure the controller starts in the
> required state.
> 
> Signed-off-by: Encrow Thorne <jyc0019@gmail.com>
Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

