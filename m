Return-Path: <linux-i2c+bounces-3992-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E152905840
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Jun 2024 18:15:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3088FB26467
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Jun 2024 16:05:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7778F183086;
	Wed, 12 Jun 2024 16:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E0982kqa"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD88F181CE3;
	Wed, 12 Jun 2024 16:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718208063; cv=none; b=kJEr0YqkxVjXLFrdM1yWpuQLxetVr8WbycGeZD/U9FZG+dEZ/ntKzf7eYtnbv69eUup5/X7XbszUMTkiXzeNifYRGGiKCHdYV45RicL9NuaCheLM2Mqrmqb+h8vVm5OEXBPaa6JIM9Z3gYZGAfWJmP8M5vR08RqDXbqe0S6rkdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718208063; c=relaxed/simple;
	bh=gOIGUfpMIXTLd85TDqSteq8y5fBFgShIqKowQU29gLg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XLbu/0bE0EI3r276PUrVlZ2EfBiiZLl1QIz+IhFberzO/NxU6XZDYMtCRKEb6QPWzvSAr+xmOe4Sj6Y/0kLiGDSucKFcxmd7p8efgfrwOY5MZyK5HPi8ja4D7JOU6ueXoDleqD/G3ZxnWTgMMLEwPzG0vv22ILv7J3aEtMhlfrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E0982kqa; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-6818eea9c3aso5209371a12.1;
        Wed, 12 Jun 2024 09:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718208061; x=1718812861; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oUyvR87tz84oToC+KHHrCPTMpSX3BtZmVsSn8BAKS4E=;
        b=E0982kqa1iqlvyYPItPkLSSWAqIPb3VrkfCUQw0ZTBVASJrMJkQSE/vrXJsnBhlcmB
         A6G4lJR+wWJPmiVg0m1o2Vwc49weAECfgoMMG2Api3VQXPU5k7Bvgx/VDZmt7WaYJVeS
         kOU05iy5aEpVnKU6p5th2v5gLYSxY0Hf1UNeU+zL/c8AByIefnVLWzbG7OnxbbaAKZyS
         PiRRYW8T2VcsY2n8BlZ/KB4tuVTw39NYmGOiD8Yv9T+70Xowkikk2jHvek0HYGUTAn96
         fLgG1IpuEb89f6Nl5iK1uImL9k6nKVvNNHsEznmvaYL9G8uunLmHOqIJL1TgwtcUhBlm
         M3xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718208061; x=1718812861;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oUyvR87tz84oToC+KHHrCPTMpSX3BtZmVsSn8BAKS4E=;
        b=GNZFsc8huy+9TOhCIjelbFsUwfHIVa+mTlru8SlbJcJqWWYiSLaPQ8G1PQSfdKmuG8
         5PfkC0xgecMomTFqt8/o2kHXwtl3392fA2TPE8hvZJBD/2KSD7PKoZnlzsPryKoTYR7d
         Rsrg/3P+Oxtgex8Wc7i3vyfRCInxylYfu8ol9kqFdXq1vHRkUOG0Af8qte5xJZyg80yn
         sFhnepxN5eubc8Wsa2YHRejsftlsYhXU5KWRuh/Nmvv9bhGM3TYKLG7K7kvVnLj/NvhR
         GQmVnPLqd7uZPaiVHPmscu09HX0yBF99xqQBsbAbtkH0oN0rp6kp756vBPfdcIGsIg/6
         M8qg==
X-Forwarded-Encrypted: i=1; AJvYcCUTZJe689SnMQlg56kOj4UCnH0QniyILbbUHRi9yWTVtkYvI14IkTRUUroD78+FUd3izzmABzy8Fe5h0k/nZIn84DhnYwXVAgX9+5TlRKVYj/A3Rwlw7QIJTWOP1X+l21eqEen2xdKDkAdMtjjcSgga2FmJZpQjNyp4ee/iG0vUtY5ZDVk9WBDf1/J/NCYduqp2nT2UsGqIRgvAOn+cCXSeAPyonIJRzQnIt9BvKnqAQ5+Rx79gyT1ksMOs
X-Gm-Message-State: AOJu0YymyuW0FpAndP9A1ucDKcztgMmadsEdUws2T3xA8PVZS+TxlHE/
	jvRzcmatEUQHP59s7QIYU5tO42xHwyCWJ3J1a5jEQsHYuBFNLuYX
X-Google-Smtp-Source: AGHT+IFt4IGyic5ndUD67jLTkXGXA3pbljy0S0BUqnqtpDXM9+DHeTRpjrpMQomwy/Si1QcCBDRxRw==
X-Received: by 2002:a17:90a:4a0e:b0:2c2:dd1d:ce6a with SMTP id 98e67ed59e1d1-2c4a76f724amr1973255a91.45.1718208060984;
        Wed, 12 Jun 2024 09:01:00 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c4a75f3584sm1957320a91.20.2024.06.12.09.01.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 09:01:00 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 12 Jun 2024 09:00:59 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Noah Wang <noahwang.wang@outlook.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	jdelvare@suse.com, corbet@lwn.net, Delphine_CC_Chiu@wiwynn.com,
	peteryin.openbmc@gmail.com, javier.carrasco.cruz@gmail.com,
	patrick.rudolph@9elements.com, bhelgaas@google.com, lukas@wunner.de,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 4/4] hwmon: add MP9941 driver
Message-ID: <7e58e227-7896-486d-bf3a-1b4db647ea81@roeck-us.net>
References: <SEYPR04MB6482721F71C0527767A149DEFAC72@SEYPR04MB6482.apcprd04.prod.outlook.com>
 <20240611101417.76911-1-noahwang.wang@outlook.com>
 <SEYPR04MB648294005D55F70736B519F6FAC72@SEYPR04MB6482.apcprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SEYPR04MB648294005D55F70736B519F6FAC72@SEYPR04MB6482.apcprd04.prod.outlook.com>

On Tue, Jun 11, 2024 at 06:14:17PM +0800, Noah Wang wrote:
> Add support for MPS step-down converter mp9941. This driver exposes
> telemetry and limit value readings and writtings.
> 
> Signed-off-by: Noah Wang <noahwang.wang@outlook.com>

Applied.

Thanks,
Guenter

