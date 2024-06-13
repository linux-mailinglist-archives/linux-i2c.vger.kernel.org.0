Return-Path: <linux-i2c+bounces-4006-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E4F906417
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Jun 2024 08:33:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF4491F2150D
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Jun 2024 06:33:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D9B313440F;
	Thu, 13 Jun 2024 06:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="dEqr5bpz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F453F9F8;
	Thu, 13 Jun 2024 06:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718260425; cv=none; b=fH7kgvt7xQ0pU2oR5hBlNO6AH5t+uMTDlkVgXkppO2RN0LSMbeoEdsLM68ZLcdCBEUayOJpTFyvvTydbCsBF6YyuR0fe8zHh4bc+aFjm2UWwQmdqMkgJyF+eLVq0FmMCo5mnRuusZAjcIY186W0sa5LWgyMXx2E1AogP4LR1IKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718260425; c=relaxed/simple;
	bh=1uwMHLAGc1z2U93IpJeP9U1wmh5+aaNHRM2UIrMn67Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N7Cmt4etQkNPFvI35MNLmN1WB3besW/2+YvHBZGQh2OkcUBsDwQfWIc7J7lhSDU1Evrr6Gcw+Z4MK3t593NDn1obeTWqoi9vR7KjpqYwuFi3nu98ZfFbOuIZKcghaHesU0UcjtzGtmnW3TbdlnTUckWTyoATD0PBctkaJG/ME3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=dEqr5bpz; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1718260383; x=1718865183; i=markus.elfring@web.de;
	bh=XYFlE3j1QdMRcqnoXdyMkbWg0pD8rOylOq8xsgg0Sro=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=dEqr5bpzK5xdO1Go5kkN5R66O4T4sY2J1WeOjZxypm07Uq+4r7ewtAponHaLuf3r
	 A1z64+8YKYgYhmO5Taz5CD0hfNKrTLKPeiK+YmlaYtUKJcEk5EM3NoXpHvL00EGk0
	 +p2iCzf2MDwMC92EkaUsU10l8sh4Z8hUtehiFgbe4BAH4yR0XHcjZZC6BvWsw5qJP
	 uIzoP9anVa8i7l3RigbB1sbpcLmD3W+MaO98p6/GXMPhVLUpic/bVs4W1iHZ5rJV4
	 dgdHuRGYqM4g6EQA6gs8Bv2ewTsoUqJPXHAxluEwZXuAxxG5iQEyXyzGJ2HNEkb1k
	 YXbZzFSY5D5kjTlNVw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.83.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MALeD-1s6PcC1eR9-000gnU; Thu, 13
 Jun 2024 08:33:03 +0200
Message-ID: <8383c494-911f-40fd-abfa-9489fada67a3@web.de>
Date: Thu, 13 Jun 2024 08:32:32 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] i2c: octeon: refactor hlc r/w operations
To: Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>,
 linux-i2c@vger.kernel.org
Cc: Andi Shyti <andi.shyti@kernel.org>, Robert Richter <rric@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>
References: <20240613025412.3848629-1-aryan.srivastava@alliedtelesis.co.nz>
 <20240613025412.3848629-2-aryan.srivastava@alliedtelesis.co.nz>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240613025412.3848629-2-aryan.srivastava@alliedtelesis.co.nz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:AMXbYtNW60HooN3NBFXHbB1Y3NnLec7m6FvFtCaVNcyGPQvnTkp
 NXw9pIZUMq17KNouN//BAiLaa9m5/2/P/PzRhGRIJMor//+TaDkeyhD2PWk5zl+zFiIAhhc
 +EzHZhPB3Mo9kObe3FRNBmTnF79H+Vx3lGLeHD0txuO5sbdoadLM2VCuVyJt2PPT68juYHd
 13Ay6jBdALkO9IkhljbHQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:mAI9eMX67FU=;y8bHKGC5TBFSkww85QHfeDMKMP5
 U27nlmA6XuE2ycXgh7EtqN4CT/KPdi0PPzOo1slHFiZjXDfPgoJC9PRaJWIbY9KeMe9cLLWJ4
 6XoEVgiXQXRdwYgFSZNYtzq9lJ4jQUILWET710WnDAi4hwyPk9DuonJHZXsykIB3KqW26P8je
 I5qmVTPv+/KJaBTapWaR4nlboS4azXZxonKtcOgaML4GBcOanOhkNv8r5LL4T+vZKWE9HkCKS
 i3YIkRXu8RItixqvsBujmfIKFjfeqCBjpr0u4pyi6QJ7poY+9KxPgr75V6iqAv0R8pSBCt0Yj
 /f1VPypZ0ERGvz3RQvmIMdR7UJoM20+b2QW7aQbBwzFyc4l8YzRsF8qi0ICSnk3eTBOU93fJM
 SnbxpbYj+e3dG0hYvcplUifXd/oefIYAzrfKm4sg4OyXIcVdZY8mguAbHeSZYcHMLSeV5Hj8m
 G2NEKDSg9Z3pI/zv4TYIcAAr5le9xwv9igIzIdg1pcGhsYOkgubdGlL6juaWf7yxQ8idmHDTr
 eo12g8QzdN1q5diZOmvs3SnSPDdSRgvs02IrIzI3vaPA2pMaGxStKBnem3uptiqpVMd1qnELs
 uI+GMEvz13p3MChWFVWJ/gy0T7R2gs8fKNaYRWPz7C72Rf5A6PlnFUjRHACx0XCBL7MlCeXH1
 ApE8rlX7rpkb+kag0m2GNdpp28HdNefC4pEJbGNTigKR4GOrtYAix9pzRHVhieBmkTa5PMiJI
 d5TqQPC7+/SW/fhfik3IqiaGAujj9qdo+HQmD+HuAAPQRNqtzBSWAG86HmYxQHEs8ItA+guO8
 9Z60hfYNZbUGWVg1vi+W1hepeAPeFJHHqHtx/QKqXA2so=

> Refactor the current implementation of the high-level composite read and
> write operations in preparation of the addition of block-mode read/write
> operations.
=E2=80=A6

* I find that a cover letter can be helpful also for the presented small p=
atch series.

* How do you think about to replace any abbreviations in summary phrases?
  - HLC
  - r/w


Regards,
Markus

