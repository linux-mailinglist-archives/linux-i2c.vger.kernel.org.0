Return-Path: <linux-i2c+bounces-6662-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2809777E4
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 06:27:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6CF481F257C0
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 04:27:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 707591C2DC1;
	Fri, 13 Sep 2024 04:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="ZA269dzg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DEF21D2F5A
	for <linux-i2c@vger.kernel.org>; Fri, 13 Sep 2024 04:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726201631; cv=none; b=K3SwpUwV3VjjNdIqa2xywf8NrKUwyW/4ly6l9cdHVO4LApkfAOOEt1l1GIDILY8AFQyW8IQ7y0NMuVBG581dimPanG8SIIKB723FyNfq07E9ImJkR8lHmi/M90XoLkAjHz83LwUAqaLHhfYQSzyF37YwzgartrkuH67aWozN72M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726201631; c=relaxed/simple;
	bh=QWltAUqEPTJdDSYi9Mp1jea2uT6Ze1iq68fk+NRCq6I=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=cwRtMxRaj7O70RzsZwCengDNE+3nfHfd4CsCcsoC92H7kXBd3T+FfiRLReXye/Io6eHbdKfD48/yTx3FCVaIBW2jdR1hXWnHNYVZk2PKtPDb2i2Cwkh5r931RHQ8D7Yvf3NnsT5Y9a72MVhBbe/iQuM6gwDRqTbYI6gvbWezhuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=ZA269dzg; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id D7FCB2C0272;
	Fri, 13 Sep 2024 16:27:04 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1726201624;
	bh=QWltAUqEPTJdDSYi9Mp1jea2uT6Ze1iq68fk+NRCq6I=;
	h=Date:To:Cc:From:Subject:From;
	b=ZA269dzgHgANNdzo+JjSrL8hms4craATnHgIvvH2RSOmIpdm0JL6Wv9oE+FxyLjTF
	 rVP72x2Agb1eR9y5+JU0VY0MV4TOdtDqkNilgudQlJ4Qwb3EKA/45GTX+Pn1I79Mlp
	 KxtOSdAMPZxfV1SwDU1bkdp9kN9MzKXJJ34Vh7EZjLm6e2rYZ8TaYDPuElSGiBOc7X
	 vbczE38vxE8rlT6uVxsuFe1wAHunccLFKNBp/h7znuupltkDbULqBmF7gODR93uVRW
	 Mjhg9ondAJ5OCry+uLd7CDVcYpie9SdLLu65GPdEIOByYar4ENUP3q69KO72Z5yjgQ
	 W3Yvaz2KZZ7JA==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B66e3bf180000>; Fri, 13 Sep 2024 16:27:04 +1200
Received: from [10.33.22.30] (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id B400213ED8D;
	Fri, 13 Sep 2024 16:27:04 +1200 (NZST)
Message-ID: <16abd358-f05c-4ddc-b776-2986dbdc175d@alliedtelesis.co.nz>
Date: Fri, 13 Sep 2024 16:27:04 +1200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: Representing an unusual I2C controller
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=Id0kWnqa c=1 sm=1 tr=0 ts=66e3bf18 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=IkcTkHD0fZMA:10 a=EaEq8P2WXUwA:10 a=jdP34snFAAAA:8 a=IBR-84ujcIp40Wy1zDAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=jlphF6vWLdwq7oh3TaWq:22
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Hi I2C Enthusiasts,

I'm starting to look at supporting the I2C controller on the Realtek=20
RTL9300 and I'm struggling a little bit to figure out how to represent=20
it. It's a bit odd in that there are basically two I2C controllers which=20
have a SCL pin each but then there are 8 common SDA pins that can be=20
split between the two controllers to give a level of muxing and/or=20
concurrency.

Basically I can have: SDA[0:7] + SCL8 or SDA[0:7] + SCL17 or any of the=20
possible permutations. I could be accessing SDA0+SCL8 and SCL1+SDA17=20
concurrently but if the hardware were connected as SDA0+SCL8 and=20
SCL1+SDA8 I'd have to make those mutually exclusive.

I think it might just make sense to represent the two entities that own=20
the SCL pins as separate controllers but then it'd be hard to enforce=20
the fact that the individual SDA pins can only belong to one controller.=20
Complicating things a bit further there is a common register that says=20
whether the pins are being used for SDA or as GPIO (that can probably=20
just be handled with pinctrl).

So I was thinking something like

i2c@36c {
 =C2=A0 reg =3D <0x36c 0x14>
 =C2=A0 compatible =3D "realtek,rtl9300-i2c";
 =C2=A0 scl-pin =3D <8>;

 =C2=A0 i2c@0 {
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sda-pin =3D <0>; // could use reg instead=
 of scl-pin
 =C2=A0 }
 =C2=A0 i2c@1 {
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sda-pin =3D <1>;
 =C2=A0 }
};

i2c@388 {
 =C2=A0 reg =3D <0x388 0x14>
 =C2=A0 scl-pin =3D <17>;
 =C2=A0 compatible =3D "realtek,rtl9300-i2c";

 =C2=A0 i2c@2 {
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sda-pin =3D <2>;
 =C2=A0 }
 =C2=A0 i2c@3 {
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sda-pin =3D <3>;
 =C2=A0 }
};

Does that make sense? I'm not entirely sure how I can have those root=20
controllers as something the I2C framework knows about without them=20
being adapters in their own right (they can't have any devices attached=20
directly that'd need to be done on one of the channels).

There are drivers for this in openwrt[1][2] but they ignore the fact=20
that there are multiple controllers and the muxing is done separately. I=20
was planning on using them for a bit of inspiration.

[1] -=20
https://git.openwrt.org/?p=3Dopenwrt/openwrt.git;a=3Dblob;f=3Dtarget/linu=
x/realtek/files-5.15/drivers/i2c/busses/i2c-rtl9300.c
[2] -=20
https://git.openwrt.org/?p=3Dopenwrt/openwrt.git;a=3Dblob;f=3Dtarget/linu=
x/realtek/files-5.15/drivers/i2c/muxes/i2c-mux-rtl9300.c

Thanks,
Chris


