Return-Path: <linux-i2c+bounces-1693-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40ACC852FCF
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Feb 2024 12:49:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E4F71C2256F
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Feb 2024 11:49:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B2C037715;
	Tue, 13 Feb 2024 11:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fZKg+pJv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00EF36AFD
	for <linux-i2c@vger.kernel.org>; Tue, 13 Feb 2024 11:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707824979; cv=none; b=lJqzVGUW0+LCgSpW0oesrinPGs4JmyUwL+pY/Z5WaUJBRwv5KmMiY6xTojE6nQbFFHBA1hGmhQNSAeQQk1EFExPslwLkNpop/YV7PBBUOed4JQOQYxh5Peg7h1EDtsQqwicz9bHnCXDTNoR///oep+8mrzPqygsj+b8WFRJXcWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707824979; c=relaxed/simple;
	bh=xHbBia3DvLTgU21+Zj6tVs3LwLBWdlcPQOUblnPl15I=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NT6eTMAaDSg9SrDtoFKbM/yyL2SbKtpL+YerTF5nUYZNyOZU4/2MUVaB6JBHrOJKopMbYQ1f/qhPDCl+nh7+XRQPCexbSfepHNA9cLwVsd2KnWPcX0Nh5YIMFsYatUlvo9iaJ/EGck8bMowGsoIcFC/CdnZ2ycBheeVOWSiCgA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fZKg+pJv; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-411d253098eso90265e9.3
        for <linux-i2c@vger.kernel.org>; Tue, 13 Feb 2024 03:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707824976; x=1708429776; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xHbBia3DvLTgU21+Zj6tVs3LwLBWdlcPQOUblnPl15I=;
        b=fZKg+pJvR9z1SOpo1honLeIKnu+e4WraQkAYhc4xKUHorZFOSpOnssZtLETX8paanB
         0QGiX8nEdoILI0wbsqEtxMdrqcWVzT6taCTYMXqNscRVpseaUAEWi70XRKIeQ7FOHioy
         k7vJqk4W0akuUA/ghlP+e2gEREL4dPujWeYBNH/QMDHD0s4bzJBi3YdhlwL94TJ8Kfyp
         llXvp40jx1uh/aQRT28RJ/yWXEKNnTmrJ1S10qSebTFuug7finQI9DZyPVVIYX06ZdT1
         p6MMOz8xEcyRnhr42hFrtZmy9N+kkY2JNQbt6W/OxQeZKLy3uJD2c0gEKWcaiINgTBMf
         Vs7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707824976; x=1708429776;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xHbBia3DvLTgU21+Zj6tVs3LwLBWdlcPQOUblnPl15I=;
        b=adwnooiuaF9p1mkXEZwBCRu7/uiz+jdmT1bLuVr30sgNDITzLnxr7mtwZQHjKe0thb
         5/9l+ODp1HAAhmitThh26bnFZZnjWNEg7hN3kF4NxKiR0IGrAMTeOMdTYVN3agtzq4vk
         G9Vks82knxDICOL0zd6/DnAyoxaHfnDv/jUCecMh3RKyBRhVoTo6GVVJ5yHuvDKuNnlD
         bAF+BEAtQhNa/CDRtXYvU1b8XI5KJv+NN07diZ/OEWLwaD8UwSJA9OlxyHx7cBbTGT0G
         Zv/W60m07NDiD3WH5OWMKopw//s2eTzl6GXDASspYkOBCV8F2sgDqTNjYCMXSFbelPTh
         yUNg==
X-Gm-Message-State: AOJu0YxqqlBYra9VWiBw80yl/GBUuVEHNVJNAC0XCiPMPcdieaCdfFN/
	u11XWBmmnH+W3hN/cjPZRq1+HxG4SojqwjT8LPbIZcJ+taQGZh3Q
X-Google-Smtp-Source: AGHT+IGaSmPVSfMvg8sonjDD6Mbo7U3qTysMfR0101urFHNkfGbYAkipHP0tEt/IAkPUQAw0LO4HQg==
X-Received: by 2002:a05:600c:46c6:b0:40f:dd72:d9f with SMTP id q6-20020a05600c46c600b0040fdd720d9fmr8047067wmo.39.1707824975522;
        Tue, 13 Feb 2024 03:49:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUbE/NRV1CAdL2X1p8jA1MrQ7cNwuXnFcyhmr+O1M760bmGA7Qw6wM6E1f8RSzFoXjimrmFknX4yc+NeSsEXnXkHT9O1X0T+COH1lzx2LYhtPAg8v+lWrZ2hvSchnqVZXXnfyYWHfb1cJ01kZUzxkWbWDLIsaatOiSl61Ru4I7gU6yv+v6czw4OxCA64iLi8+O0u2eFZ0eLVoYx2Fr39FeS9JIuGIMyppBvnM84NU1SkAy+tz8C8mEc1Z/3/sPkaKY2roVBSMKxZ+pX
Received: from giga-mm-1.home ([2a02:1210:8690:9300:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id v9-20020a5d4b09000000b0033b843786e1sm4607739wrq.51.2024.02.13.03.49.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 03:49:35 -0800 (PST)
Message-ID: <28430e65f50749bf446ed621d116ba8fb895add7.camel@gmail.com>
Subject: Re: Potential bug in SMBus kernel module
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Jean Delvare <jdelvare@suse.de>, "Zakowski, Piotr"
	 <piotr.zakowski@intel.com>
Cc: andi.shyti@kernel.org, linux-i2c@vger.kernel.org, "Shepon, Oren"
 <oren.shepon@intel.com>, "Kozlowski, Pawel" <pawel.kozlowski@intel.com>, 
 "Usyskin, Alexander" <alexander.usyskin@intel.com>, "Radtke, Jakub"
 <jakub.radtke@intel.com>
Date: Tue, 13 Feb 2024 12:49:34 +0100
In-Reply-To: <20240213120553.7b0ab120@endymion.delvare>
References: 
	<SJ0PR11MB5133C098821363F292316A0088482@SJ0PR11MB5133.namprd11.prod.outlook.com>
	 <20240213120553.7b0ab120@endymion.delvare>
Autocrypt: addr=alexander.sverdlin@gmail.com; prefer-encrypt=mutual; keydata=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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Jean, thanks for including me!

On Tue, 2024-02-13 at 12:05 +0100, Jean Delvare wrote:
> > 4. Observed bug
> >=20
> > In the "Block Write-Block Read Process Call", the FIFO index should be =
cleared twice.
> > Testing of the Linux driver for the above scenario has shown that it on=
ly clears once during the write part (writing data to the FIFO buffer) and =
does not clear before the read part (reading data
> > from the FIFO buffer).
> > As a result, the command only returns a portion of the data (N-M) and l=
eaves behind residual data from previous SMBus commands that used the FIFO =
buffer.
>=20
> Support for the Block Write-Block Read Process Call command was added
> to the i2c-i801 driver by Alexander Sverdlin in June 2019. I'm adding
> him to Cc, but he changed addresses meanwhile, so I hope I got the
> right Alexander.

While I'm trying to remember the details of the story ;-), could
you please point me to the full bug report? I suspect it has not actually
been posted to linux-i2c?

--=20
Alexander Sverdlin.


