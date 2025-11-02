Return-Path: <linux-i2c+bounces-13942-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C22C2917D
	for <lists+linux-i2c@lfdr.de>; Sun, 02 Nov 2025 17:06:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BAB2C3AC351
	for <lists+linux-i2c@lfdr.de>; Sun,  2 Nov 2025 16:06:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC3C722422D;
	Sun,  2 Nov 2025 16:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="msxrFTEp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E1B7381C4;
	Sun,  2 Nov 2025 16:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762099584; cv=none; b=SmmDHQyyzwq/y6YC318RH4OoqlGWFl5GS24GpUDq0T4Ly260jO7O1ptb0ZTZSwou7zwaKyS5A0XGVI04qD5vDniSqqySLdMIaTeGb5u2JNH26cKBW98EYWdmfe3TNZsxl1Bj92eKOQ8vY3abtPIaTM2nf8dQ0wpglECCN4DpaUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762099584; c=relaxed/simple;
	bh=jsCerW2XcCxZo9RghFiignYIfWNOvlatNHDxwnod7hs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IclgZzmWTMiqlJtaFOgRDL8aeHZNJA4r2SRJan/mBapW9baQp/tneDCzix19wUctwo+al8T13Nm4z/fBsWmlTHRxYMC4Ng3io/i5QhXO8gQmoR1fXQjRgeahAn/ZqplDvaB/gOUIeCLHWm1vQ5WrGWujtByV75gg10/r727LzIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=msxrFTEp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D768C4CEF7;
	Sun,  2 Nov 2025 16:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762099584;
	bh=jsCerW2XcCxZo9RghFiignYIfWNOvlatNHDxwnod7hs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=msxrFTEp+/fHanX6EF1b+8qnccrGv2WA5AJQsk0ThO0ym8B6ZnqL55NVZ0sWSpnQ4
	 JzJ6hdt/eXjoP0jfG8vqqyrqteZrtSDntQ/aOD8RXhPu+7cSkKtsC+ZmVpa6L/I7Oo
	 IxiANoOmyQPQVDlYz4oZdYwkuB13QYCQ80LuPO48ggfMLIH+oHd2/3+ybP9pNjUTPB
	 I0/ypc5jLPwEjzi3QiDurfhGiaU6XnJ+NOzo9BEFAK+GVRRmYLsDBeizXv8ydb1bSw
	 1sFDFswrFZWq1qBg4iVyVYMCOTXXXcrI+Ue/F3lR6uGdPphc2pP4BhyfF8I6CgkCRu
	 SGyhdLgon3rDg==
Date: Sun, 2 Nov 2025 17:06:21 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>, Loic Poulain <loic.poulain@oss.qualcomm.com>, 
	Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, aiqun.yu@oss.qualcomm.com, 
	tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com, 
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>, Atiya Kailany <atiya.kailany@oss.qualcomm.com>
Subject: Re: [PATCH v5 2/6] media: dt-bindings: Add CAMSS device for Kaanapali
Message-ID: <20251102-charming-angelfish-of-experiment-eaa4bc@kuoka>
References: <20251030-add-support-for-camss-on-kaanapali-v5-0-f8e12bea3d02@oss.qualcomm.com>
 <20251030-add-support-for-camss-on-kaanapali-v5-2-f8e12bea3d02@oss.qualcomm.com>
 <631e4da1-92a0-4d44-b92e-bdcc56196c26@linaro.org>
 <e9da04ab-5119-4bfd-a25c-50e7b2ef05d3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <e9da04ab-5119-4bfd-a25c-50e7b2ef05d3@oss.qualcomm.com>

On Fri, Oct 31, 2025 at 10:39:44AM -0700, Vijay Kumar Tumati wrote:
>=20
> On 10/31/2025 6:50 AM, Bryan O'Donoghue wrote:
> > On 31/10/2025 02:59, Hangxiang Ma wrote:
> > > Add the compatible string "qcom,kaanapali-camss" to support the Camera
> > > Subsystem (CAMSS) on the Qualcomm Kaanapali platform.
> > >=20
> > > The Kaanapali platform provides:
> > > - 3 x VFE, 5 RDI per VFE
> > > - 2 x VFE Lite, 4 RDI per VFE Lite
> > > - 3 x CSID
> > > - 2 x CSID Lite
> > > - 6 x CSIPHY
> > >=20
> > > Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> > > ---
> > > =C2=A0 .../bindings/media/qcom,kaanapali-camss.yaml=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 406
> > > +++++++++++++++++++++
> > > =C2=A0 1 file changed, 406 insertions(+)
> > >=20
> > > diff --git
> > > a/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml
> > > b/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml
> > > new file mode 100644
> > > index 000000000000..c34867022fd1
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.ya=
ml
> > > @@ -0,0 +1,406 @@
> > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/media/qcom,kaanapali-camss.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Qualcomm Kaanapali Camera Subsystem (CAMSS)
> > > +
> > > +maintainers:
> > > +=C2=A0 - Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> > > +
> > > +description:
> > > +=C2=A0 The CAMSS IP is a CSI decoder and ISP present on Qualcomm pla=
tforms.
> > > +
> > > +properties:
> > > +=C2=A0 compatible:
> > > +=C2=A0=C2=A0=C2=A0 const: qcom,kaanapali-camss
> > > +
> > > +=C2=A0 reg:
> > > +=C2=A0=C2=A0=C2=A0 maxItems: 16
> > > +
> > > +=C2=A0 reg-names:
> > > +=C2=A0=C2=A0=C2=A0 items:
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: csid0
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: csid1
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: csid2
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: csid_lite0
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: csid_lite1
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: csiphy0
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: csiphy1
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: csiphy2
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: csiphy3
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: csiphy4
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: csiphy5
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: vfe0
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: vfe1
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: vfe2
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: vfe_lite0
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: vfe_lite1
> >=20
> > No test pattern generator on this part ?
> >=20
> > We have patches in-flight to add TPG so it makes no sense to omit these
> > registers from current or new submissions.
> >=20
> > https://lore.kernel.org/linux-media/20251017-camss_tpg-v5-1-cafe3ad4216=
3@oss.qualcomm.com/
> >=20
> >=20
> > While we're at it we should consider adding in the other key functional
> > blocks.
> >=20
> > OFE, IPE etc, there's no harm in including the registers even if the
> > intention and outcome is never switching that functionality on.
> >=20
> Hi Bryan, we have quite a few register spaces on Kaanapali or any other
> target that are not required for the RDI only CAMSS driver, including ICP,

Please read writing bindings doc. It answers this question exactly.

I'm marking it as changes requested in DT patchwork.

Best regards,
Krzysztof


