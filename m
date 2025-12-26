Return-Path: <linux-i2c+bounces-14778-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 291DACDE4A2
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Dec 2025 04:27:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 35B77300C5E8
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Dec 2025 03:27:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8F75313E18;
	Fri, 26 Dec 2025 03:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="JANkgSTu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05BB6313279;
	Fri, 26 Dec 2025 03:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.22.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766719651; cv=none; b=XSvjIMPn9Mmpexp1UfoDVE2dtnktyhUdd+vs/OOkfBaTpSTKY47NCtGLq6B3Gp1LhY97KQgUSHJrxOrf9R8rhe0L6+IXiMIw517XnQZAwdlxwr8s1nIW4joa7i6fxrMo9MsaJPuG+h20hpavty3OmzCTpoy3J71Igd7CFPFXHEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766719651; c=relaxed/simple;
	bh=BgXzJDqwoyDsix3C/1tUhRxvBXkILq8KJJWurzQ8XnU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rd/+5ESayvDwpfeQG1jJNFaPeWlkTTaYDgJHTG3vAYn4lLpIAdosU70zUVqGbZavJp/BPEKaELIdUkXT0JGd0WZXN9xgC2ixby/OWDiXVbzUkDgZ92/jT+vHXlvzx6W89X6es1lAv3xJROQG4tVbCneppCZG8F6ajTxU9JMz6Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=JANkgSTu; arc=none smtp.client-ip=54.207.22.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1766719558;
	bh=d4wAjrfZaiGw8WX4hHJd4M+lVGETHBvdtA4Tr1bun5g=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=JANkgSTuVRx+6NDdzzzicfV1VHbc5JHd5Vz1D93L0UREW5Zu9GakNyt8QAGb/LZRo
	 u6kgHasHHosZMxyqYyassWoF8mRCSFfQsKc/lMPrkxpX6cid4/ArN42UM5j+b/rBSE
	 R06a043S+lDHiDfY358HJ9Mo4P6/cF8ajd/jC+RQ=
X-QQ-mid: esmtpgz13t1766719550t82a12a29
X-QQ-Originating-IP: PieMHnuodpUbtX3Z4xQgyrHPViUuOiKsiF0WOIWLd8k=
Received: from = ( [183.48.244.228])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 26 Dec 2025 11:25:48 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13964547808078100876
EX-QQ-RecipientCnt: 20
Date: Fri, 26 Dec 2025 11:25:48 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Encrow Thorne <jyc0019@gmail.com>,
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
Subject: Re: [PATCH v2 1/3] dt-bindings: i2c: spacemit: add optional resets
Message-ID: <65A454B4ACFB1A38+aU4APFpyblOCKqJ4@kernel.org>
References: <20251219-i2c-reset-v2-0-ad201a602e74@gmail.com>
 <20251219-i2c-reset-v2-1-ad201a602e74@gmail.com>
 <04880c83-0b3a-4197-9043-d657db91f922@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <04880c83-0b3a-4197-9043-d657db91f922@kernel.org>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MIfPdqFTtU/fn7oLTGYkZ0c/4VuPNpisMQEjcz/egD5/ixeXzTpYrQTv
	hjXsGTa4IeM0R0jPDjtAtLyJKJJDbZq7wnIHBc45S02KcJl4BCsspRFYdNynRUUyRVYGbCX
	KubTsh2p2G+tIelw4NUpVyzFjSXY+mPawbjf1xW3zeH4yjPfmXIrJtXiUHuRJ+DpNoCQn0Z
	EpeAPhU3x/ww7DsxWsuaZdP8mDd3UdvM0A6xy3BhKMUC47DXVSJ8elXNdU0BJMVvdm+uw3y
	o8dakn4zjJpRwXiEfcD7AYVrg/vttmmpP5DEYVFqTSkn7/t5JP8oxPllktOEwdPhf0JHZAv
	mUmF7mQiFB7lmaVWGmGMCntQs9nBcKXcMUPKEHWwJI9qEr3eGCaw/bq8/UiU4CbE2/QTNrx
	FUbzq1c9VJQaKc3PqtR7raaF3qvb1v6d4ynz6e+beQan2FwLDCuYH3UUhVyFVKlHjHfj0WX
	GhDq9c3sFleL4rQW21ejC8Iprpp2IWluBBW936nmoYxhpVmmnJZl56vvPraa/jbGL49fr1M
	cB1ZT0SBJfs5YvMfq4cVR54obauBmq0K1RhQZD2b7MxTA16ZLBgyn7sz9xPVRmFfYAkk/vG
	Mu4nukO6wXbzbv7XVHphj1hzzlxYSD0tfgfQ0Uj2SNKgQ8ojrygY1DM/89K6HetBK+l/nR9
	tLdIQps17SptGpfy5LH2ifR7MzFw7PHFYNIVQXojyNi/dpzogfU0gj7iKh/s4yphZP2Qgk3
	lBszomX49tO4dTi56OzZveb8GUoEqYfR86uSG+bhaUB+87UkXPPEXQGDJVf8poMwUGzOrA1
	dXq8RuhpCylu6PpY0BH1GzjDXAhnhSeAdf7wOG1otKQZ+SmQePhMoBpnF8iWEGFaMuxFn+u
	EiWY4iafjqaThCrBeAUGyvZhW75c1VbxKkP2EP4Tlcx2zp6ifPMuCjjtxjNcIRoxKbbqWrv
	VoOpeH5X9cl0c58zhipE6tgepGhEIvR5OpoDm3mM/IMamg1zejOlOm8Zs1WbNbNW6UvrATi
	MxVM/G6APAsukPmhZUFIOH9IO/HAbcUpVQnrq8g2+/O9f9oOzqGw03xz3idIVBEZ3Tt6kox
	Q==
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0

On Fri, Dec 19, 2025 at 09:03:14AM +0100, Krzysztof Kozlowski wrote:
> On 19/12/2025 08:42, Encrow Thorne wrote:
> > The I2C controller requires a reset to ensure it starts from a clean state.
> > 
> > Add the 'resets' property to support this hardware requirement.
> > 
> > Signed-off-by: Encrow Thorne <jyc0019@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
> > index b7220fff2235..1290106e28e6 100644
> > --- a/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
> > +++ b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
> > @@ -32,6 +32,9 @@ properties:
> >        - const: func
> >        - const: bus
> >  
> > +  resets:
> > +    maxItems: 1
> > +
> 
> Still between other clock-related properties. You already got such
> comment...
Please replace it below clock-frequency.
With this fix, you can add my tag:

Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> 
> >    clock-frequency:
> >      description: |
> >        K1 support three different modes which running different frequencies
> > 
> 
> 
> Best regards,
> Krzysztof
> 

