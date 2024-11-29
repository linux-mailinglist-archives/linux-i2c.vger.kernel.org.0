Return-Path: <linux-i2c+bounces-8256-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E76B9DC135
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Nov 2024 10:12:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 17E89163C4A
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Nov 2024 09:12:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D84F170A30;
	Fri, 29 Nov 2024 09:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nh5hDs9j"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79020143C40;
	Fri, 29 Nov 2024 09:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732871569; cv=none; b=IN+Z3ychhzf8YQoh7dZkLnrAxCtCewdZRJBG2pMAMS2GBNL/IVNk1MkbsFwx7Wf6cOg1D7xsXdB4kvPi6WSEqJv50wtwPGwB9uhLVXjwrxuQCuX5SquF+9jDdMt5sqdvQRb9hD1CujoNqjNkqMqEyjQaB8cFROh298Wz7yxf0Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732871569; c=relaxed/simple;
	bh=dJ6IY9QS2O7JmjJbpKwvcmlKLPRPwSASvHz6cnbvrLs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=U6+QnQQEiNh2Ri5xb8aoY+L/YC+OzUIPl1xiXIvGky8X52oybBWAy53tCBnwVJrW1cPtM4x+sxbFvNkg+FUbjWd/G7owFqt3hqJdsFRRWdC9Co+oquIPb0TcxCY9J23w5vJ2CM/2DWGdbzTvWHp+sf2D2PCAH1uHJXlEl62n9W8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nh5hDs9j; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43494a20379so15018755e9.0;
        Fri, 29 Nov 2024 01:12:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732871566; x=1733476366; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dJ6IY9QS2O7JmjJbpKwvcmlKLPRPwSASvHz6cnbvrLs=;
        b=Nh5hDs9jvWHa7g6XKUzzk6RbohMA4yWRH/0FyVqTamfleTR2jDmhtBV6vVtsF0Yp3q
         hYvDSa/U1xh1Vq7nfQIUII8WtLUocOUv8N4kYFlm4ly8wmrTJLhU9/+adaPap6FSj2Wx
         SunBZzurAuCbg8Ijot8JKmnV6tdRfIg9KkhkKQqVcmwqMur0w9N7hfIwToxCD/EHCQGW
         0PxFNNCkiLRXO6axwy49zT1OTNdyqKF4vr6Crp2Pf1Ld++WceeI9q23PlthTzOiTZOgw
         UrI6qwuUELItoJ0uDuKqWHcMguFqp0RVucjgOnZ98LrLSjaHevp691w/cUe4zHr5xG5A
         se2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732871566; x=1733476366;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dJ6IY9QS2O7JmjJbpKwvcmlKLPRPwSASvHz6cnbvrLs=;
        b=ramd/flqrfUgYbvUePutpmzEwbbJpu/hwToSsboVrquCYPXTpZgRGYw4Yu7p/R3CjP
         UeObpS0tFrWqiNK2PfhJSOG69W0QpfMemM4q1t3t0ZVFUhLkiMsh1LNXJ0bIrnc71HAN
         NUv/eCp1jqNc5SulWjeAhdMlCED0abrNTEDO97q6pn3xOGAbvfPmli+F3ztqx1MSZDZC
         3d0ZXeDmZk2w0UIuzIVtO4FNcRnyvOuNMnXWz1VlSs5+tCWSbhmjEziaL7SVANvF30zw
         ZwnmElTWTYhcQQiHQLjZ2rTj4syhEeu4XwraQ7jinpamnqhjf0j3o32RpqAOJPyd9wdO
         tLCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUorMr5T8BhlRLTWs9G7wArGnJ2Dqch5fFivwy/N13NzAnB0YiV0snTpSux39g//jmykWbdOmywhNE=@vger.kernel.org, AJvYcCV/XDpPPxCzmxNchsMYnuO6n4MnQpQYlJMS2udTjRr1tUqYY5yw1GJRiu1sXz5XYn/D87wsRXZVprXl@vger.kernel.org, AJvYcCWfY7VinHM6slJVnLqBMDpNFsfd1DTgeWGqXj5TzJ+dkaZidf53EyVoPNKcl9GQC6cMOGwDWdW75kbmRteA@vger.kernel.org, AJvYcCXCCjz3R5dICvkgMGVYZSfmLNxR8gSboDFSrKwcW6DY4WcMVa+j4Cz6LeOe0cm7i/DwEltw2saga9U8OE8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGzXBWzp5xqMm3EeLJH070GBH8VxXgtcZMT2n/ZGmMam1ICPPt
	H3oGfov6wtb5rms0l0p1SGlH6jzgrPJrnpxRZ4ZtUg+mIBaJzzU0
X-Gm-Gg: ASbGncuEsvqY6TIi8MP4HKsLPRphrBD0pzkfWqgGvVgIXZpZyQ0eh+YdG+Jb5Z1tIkw
	YcD0dwec2RvgN1gvG5tJ3hME71lMPeGhxO+mrMHGXsNbMRI8b+FwtVustezx2/hpRgOh0T/bD9V
	Ym4W6bkSvxfXUoprK8f1ZOE+Q+to8x7u7iajkGY417bfMrSkV63iHX3pCkOZ9HVeTjjxu492Snw
	jXn5E23oZN/cWcILg8v43qRzNMzyoNIg3IeFJpJoUw4fR4HZNq0FLJEUNJNpXFNE3sm5b7K6Gpk
	hFyVZ8DvqlxMHNcbqNQu5BI=
X-Google-Smtp-Source: AGHT+IGF5USQPPQnUyvNi/ekI6n1SlDmZye8w3YoCpMzfV67iTqVMeWXyPxA03INAS0aAlQ6wy7ufA==
X-Received: by 2002:a05:600c:4e8a:b0:431:5ab3:d28d with SMTP id 5b1f17b1804b1-434a9dc3cc3mr100465735e9.9.1732871565606;
        Fri, 29 Nov 2024 01:12:45 -0800 (PST)
Received: from ?IPv6:2a01:599:923:c59f:ea19:16d1:ab07:4803? ([2a01:599:923:c59f:ea19:16d1:ab07:4803])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385ccd36855sm3905633f8f.36.2024.11.29.01.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2024 01:12:45 -0800 (PST)
Message-ID: <f0cbbbe4b20f828fbd48b504a58437c06ef90908.camel@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: (pmbus/adp1050): Add bindings
 for adp1051, adp1055 and ltp8800
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: "Encarnacion, Cedric justine" <Cedricjustine.Encarnacion@analog.com>, 
 Krzysztof Kozlowski
	 <krzk@kernel.org>, Guenter Roeck <linux@roeck-us.net>, Conor Dooley
	 <conor@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, Jean Delvare
 <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>, Delphine CC Chiu
 <Delphine_CC_Chiu@wiwynn.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Sabau,
 Radu bogdan" <Radu.Sabau@analog.com>, Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?=
 <u.kleine-koenig@pengutronix.de>, "Torreno, Alexis Czezar"
 <AlexisCzezar.Torreno@analog.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>
Date: Fri, 29 Nov 2024 10:12:45 +0100
In-Reply-To: <PH0PR03MB6938F9DE7173FE958D645CFE8E2E2@PH0PR03MB6938.namprd03.prod.outlook.com>
References: <20241120035826.3920-1-cedricjustine.encarnacion@analog.com>
	 <20241120035826.3920-2-cedricjustine.encarnacion@analog.com>
	 <20241120-process-hulk-ecedcbf088f7@spud>
	 <dfe8e47e-6c31-4b11-b733-38e5bd0e49d3@kernel.org>
	 <7e55a403-eb1c-4369-8180-1639b50cc9b1@roeck-us.net>
	 <4d907ddf-16ca-4136-b912-f571a691dc90@kernel.org>
	 <PH0PR03MB6938F9DE7173FE958D645CFE8E2E2@PH0PR03MB6938.namprd03.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2024-11-25 at 02:44 +0000, Encarnacion, Cedric justine wrote:
> > -----Original Message-----
> > From: Krzysztof Kozlowski <krzk@kernel.org>
> > Sent: Thursday, November 21, 2024 2:39 AM
> > To: Guenter Roeck <linux@roeck-us.net>; Conor Dooley <conor@kernel.org>=
;
> > Encarnacion, Cedric justine <Cedricjustine.Encarnacion@analog.com>
> > Cc: devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-
> > i2c@vger.kernel.org; linux-doc@vger.kernel.org; linux-hwmon@vger.kernel=
.org;
> > Jean Delvare <jdelvare@suse.com>; Jonathan Corbet <corbet@lwn.net>;
> > Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>; Rob Herring
> > <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dool=
ey
> > <conor+dt@kernel.org>; Sabau, Radu bogdan <Radu.Sabau@analog.com>; Uwe
> > Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>; Torreno, Alexis Cze=
zar
> > <AlexisCzezar.Torreno@analog.com>; Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com>
> > Subject: Re: [PATCH 1/2] dt-bindings: hwmon: (pmbus/adp1050): Add bindi=
ngs
> > for adp1051, adp1055 and ltp8800
> >=20
> > [External]
> >=20
> > On 20/11/2024 19:07, Guenter Roeck wrote:
> > > On 11/20/24 09:35, Krzysztof Kozlowski wrote:
> > > > On 20/11/2024 18:11, Conor Dooley wrote:
> > > > > On Wed, Nov 20, 2024 at 11:58:25AM +0800, Cedric Encarnacion wrot=
e:
> > > > > > add dt-bindings for adp1051, adp1055, and ltp8800 pmbus.
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0 ADP1051: 6 PWM for I/O Voltage, I/O Cu=
rrent, Temperature
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0 ADP1055: 6 PWM for I/O Voltage, I/O Cu=
rrent, Power, Temperature
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0 LTP8800-1A/-2/-4A: 150A/135A/200A DC/D=
C =C2=B5Module Regulator
> > > > > >=20
> > > > > > Co-developed-by: Alexis Czezar Torreno
> > <alexisczezar.torreno@analog.com>
> > > > > > Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@anal=
og.com>
> > > > > > Signed-off-by: Cedric Encarnacion
> > <cedricjustine.encarnacion@analog.com>
> > > > >=20
> > > > > Why did you drop my ack?
> > > > > https://urldefense.com/v3/__https://lore.kernel.org/all/20241106-
> > linoleum-kebab-
> > decf14f54f76@spud/__;!!A3Ni8CS0y2Y!7Q2KluGdg8cJW_wYUd-
> > vh5mP66Ns62VZOkPG4Jf7NY9ULtTfjiwYqrUHbik_tI9X4izI6fAQS_7eVscdEFK_X
> > OEm$
> > > > So that's a v2? Or v3? Then should be marked correctly. Please star=
t
> > > > using b4. I already asked analog.com for this in few cases. Feel fr=
ee
> > > > not to use b4 if you send correct patches, but this is not the case=
 here.
> > > >=20
>=20
> Okay, I will start exploring b4 for future patches.
>=20

Next time, reach out to me. I have been pointing everbody to b4 (if asked n=
aturally).

> > >=20
> > > In general I agree, but this is a combination of two patch series, as=
 mentioned
> > > in the summary. I am not sure how to use versioning in such situation=
s. Is it
> > > v2 of one series or v3 of the other ?
> > I would say the highest and keep the b4 changeset. This allows to use b=
4
> > diff easily. Choice done here - v1, no usage of b4=C2=A0 - breaks every=
thing,
> > look:
> >=20
> > b4 diff '<20241120035826.3920-1-cedricjustine.encarnacion@analog.com>'
> > Grabbing thread from
> > lore.kernel.org/all/20241120035826.3920-1-
> > cedricjustine.encarnacion@analog.com/t.mbox.gz
> > ---
> > Analyzing 13 messages in the thread
> > Could not find lower series to compare against.
>=20
> This is v2 of one and v3 of another. For the upcoming versions, should I
> proceed to v4 which succeeds the highest or continue to v2 based on this
> series?
>=20

It seems to me the highest is the preferred...

- Nuno S=C3=A1


