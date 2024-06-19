Return-Path: <linux-i2c+bounces-4108-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D737290E4AC
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Jun 2024 09:38:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EAFAF1C21F59
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Jun 2024 07:38:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2A7476413;
	Wed, 19 Jun 2024 07:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b="TjVzyDQH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1143D7603A;
	Wed, 19 Jun 2024 07:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718782688; cv=pass; b=OQvjfiH5EUAl4xZUj3QBdrAvKGwREHs4A+kAafyPfnt1TY3cfvxTcd5zw3DY7a5PlJSgP3uiEn7aVYo+fqzd7Vvj0V00nYETKkn2gDZ5+Tsz7gdxdSkDgTE4CvOWpONTQoBb4iGVhD18vTNQsHcsSFxDM+8mmIMOwVQeXdI3jVI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718782688; c=relaxed/simple;
	bh=dILstQIUai3DtXRp/q1RJsBjK8QEmdTG5Y18JKqP2W8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cmHv4u5nbkz7fCGw+5XC8fLzbrkZicmgz5wkoUTKSga6mtM29KAMvHF0T6ONN+FJSYpPt4m/iC5WLN3VkXSMil2OfnPYFN7Q1GaBY/6C90C7ojf3AUFZzNiPiJ04ChH6+Z+KCaW2ymcYwx5RjnUboELyaGto3iNzh4xGFdU/CCA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me; spf=pass smtp.mailfrom=icenowy.me; dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b=TjVzyDQH; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icenowy.me
ARC-Seal: i=1; a=rsa-sha256; t=1718782667; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=F+jzLTyut4HRZWWwAgeDjA64/l80zDaCJxNwJicBERv3K4ZhePzZRL/ecXwTuAMsGU88cITkwR1ZNCGR3BUQbsq6oP9yyMz6ZecxuqIOofMi6dnQ+4rDTJ3sVtHcJbsV20ex5d94ZwenJ9zQCUqN+8po8f+fNZy8KHXU6kQwQMg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1718782667; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=dILstQIUai3DtXRp/q1RJsBjK8QEmdTG5Y18JKqP2W8=; 
	b=PWTJXsoFWh6Sn5jhrZaehWp0R9DIPlnMpNK/NK3fCsQ4AOYZq+JjhfklfEYnhdCGbIiRq1lzf9NJpvrtF9lgjkVf8nl2IBr+BkCvw6a+yPdnQg3iUQnC5w27O5jEf6l0J/lOwS04m5PBHCYUPfr2CA/b1XMBBTxO9h010IQ3j6U=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1718782667;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=dILstQIUai3DtXRp/q1RJsBjK8QEmdTG5Y18JKqP2W8=;
	b=TjVzyDQHnxTueOSE1UJ6XmDsaK59/K6M9HDxC35xMfbXxaGSbFhEx3/+kkAoRYVw
	bB7G308woo+fsOPN8fhGDDvCtieUWoxTRSupa8XebcOwsTi3ImQx3WWEZyq00MtgCKv
	A0oDYJBD3X+5BZVVWTI0zoB+e4qQtBHVoLmleWoJcbOYc1ARXWFAdH9WOvgR96fFPdK
	XqN5WMcW52xIpq1WyAGulEebLxW2aX+DU/ZkJPvwo/+8sYwFMm5WkdDbnznI+5I7rnA
	p7j7glCkDMDnIRdQsyCrvx0VtrBMRcUWT7IJTzsWexJSK+TdP2O0km8xbt1CMp7cprO
	dduYLcqzTA==
Received: by mx.zohomail.com with SMTPS id 1718782666075684.338458172934;
	Wed, 19 Jun 2024 00:37:46 -0700 (PDT)
Message-ID: <95c4d5e165992e8b775ec41a6948bda400b4c82f.camel@icenowy.me>
Subject: Re: [PATCH v3 1/3] dt-bindings: i2c: dw: Document compatible
 thead,th1520-i2c
From: Icenowy Zheng <uwu@icenowy.me>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>, Thomas Bonnefille
 <thomas.bonnefille@bootlin.com>, Andi Shyti <andi.shyti@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, Guo Ren
 <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Drew Fustini
 <dfustini@tenstorrent.com>, Emil Renner Berthing
 <emil.renner.berthing@canonical.com>, Conor Dooley <conor@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  =?ISO-8859-1?Q?Miqu=E8l?= Raynal
 <miquel.raynal@bootlin.com>, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>
Date: Wed, 19 Jun 2024 15:37:36 +0800
In-Reply-To: <f427b28c-420b-4174-a670-70f626f8061e@linux.intel.com>
References: <20240618-i2c-th1520-v3-0-3042590a16b1@bootlin.com>
	 <20240618-i2c-th1520-v3-1-3042590a16b1@bootlin.com>
	 <f427b28c-420b-4174-a670-70f626f8061e@linux.intel.com>
Organization: Anthon Open-Source Community
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ZohoMailClient: External

=E5=9C=A8 2024-06-19=E6=98=9F=E6=9C=9F=E4=B8=89=E7=9A=84 09:40 +0300=EF=BC=
=8CJarkko Nikula=E5=86=99=E9=81=93=EF=BC=9A
>=20
> Your comment below makes me thinking is this change needed? So is it=20
> enough to specify "snps,designware-i2c" for the compatible string in=20
> patch 2/3?

I think it's a common practice to have a SoC-specific compatible along
with the specific compatible, in case any silicon quirk is found.

>=20
> "It appears that the TH1520 I2C is already supported in the upstream=20
> kernel through the Synopsis Designware I2C adapter driver."


