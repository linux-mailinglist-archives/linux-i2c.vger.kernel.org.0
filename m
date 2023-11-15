Return-Path: <linux-i2c+bounces-185-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B22AD7ED78D
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Nov 2023 23:46:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E318A1C20B78
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Nov 2023 22:46:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB94C43ADD;
	Wed, 15 Nov 2023 22:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mHyjgMg6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BC571AC;
	Wed, 15 Nov 2023 14:46:06 -0800 (PST)
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-3b6d88dbaa3so112319b6e.1;
        Wed, 15 Nov 2023 14:46:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700088365; x=1700693165; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8GRR5+TtT69P//O5Q8RWJy3CDQOAIoE5wweaPetEfz0=;
        b=mHyjgMg6IcYpAyRsjaTqNK9TCLsL6h4DV133+xiuitD7tMXeDbhRs2Lb/G/REwGeaI
         y236aeXyENdDf9hUe2jehkUPRsmhcSFYKgh6g+8KLWEYBQXBuoQWc9Wf7O1HOqSw0Nu+
         xIUd4PCmsWawPI8yOjZzF/llfTHmt1+vAtABBDKWF/3K7PocYLmzZIPNvkEF8evw8kf1
         ipsGP7d51iAq2dFoU4ZvN9ceshOd3vzCo5r0nDCXvHRZrEMVN97K3MSeEamBPocNXWto
         YUojP1Y328nmvPoa0Hr2JM0pqWSPsKc9I5puKm1nQyio+GN4hx41ovYv4QMOtZwYNqnH
         j25w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700088365; x=1700693165;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8GRR5+TtT69P//O5Q8RWJy3CDQOAIoE5wweaPetEfz0=;
        b=D7prfZFQTZ6bbDmU0wNamF9LTrUicfQd/EdNusNEsE72s63byRxifxVu8trV6YIQPE
         wRAKSxoIFYERKowrD9AGdDbUScHnyuA1R+LCIxjfFFM2yV9kU3BeeQ102gALDD/p+067
         ru/qr67ZBgPWsfSWUIxZLkSCRxMuY0TkiHdpOk37JoZ34O+aOQAxfXDQXZMcW1kmkA+k
         CaeKbZDlZs1xOjm6XLCcv/AIcnrF2KzwTYTa1R0RWK2HknA5LxSo43ruFOwYhsi5oaDx
         MmeM7SaW6dmsSpSDqRKEdP1CS8tk3haInzZTavTaT9XVIdPvdkffDFtWo6LgsRmdM1BJ
         Ii3g==
X-Gm-Message-State: AOJu0YwrhY4CtRbSwFWieebmNUJC1yGgrjpp1ZmQ7SV6VRE29UsejrVG
	EzD1FqcuYD2Py5kqN3tt+7Tt+qz5WdY=
X-Google-Smtp-Source: AGHT+IEbaMZLZppucpqDyccqgHp3E4itdOMwPQDI8ude5VDnReEr7rQm62RVYEEJSUegcE1B5kUZvA==
X-Received: by 2002:a54:4389:0:b0:3b5:9541:cb43 with SMTP id u9-20020a544389000000b003b59541cb43mr15234608oiv.14.1700088365661;
        Wed, 15 Nov 2023 14:46:05 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h1-20020a056808014100b003ae0e57874fsm1626254oie.21.2023.11.15.14.46.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 14:46:05 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 15 Nov 2023 14:46:03 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>
Cc: "patrick@stwcx.xyz" <patrick@stwcx.xyz>,
	Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] hwmon: pmbus: Add ltc4286 driver
Message-ID: <e2d17ee5-f09a-4c29-b719-9ac6178af1e4@roeck-us.net>
References: <20231026081514.3610343-1-Delphine_CC_Chiu@Wiwynn.com>
 <20231026081514.3610343-3-Delphine_CC_Chiu@Wiwynn.com>
 <2ef2e804-d498-a2ae-9717-dd03bfd26853@roeck-us.net>
 <SG2PR04MB5543FEAFC1777ADE29239AC9A1A0A@SG2PR04MB5543.apcprd04.prod.outlook.com>
 <e223764a-c081-4634-810b-56886a29804a@roeck-us.net>
 <SG2PR04MB55436CFA902895FD5472838AA1A9A@SG2PR04MB5543.apcprd04.prod.outlook.com>
 <4b73a239-c90e-4515-b89d-65de15a1e9a9@roeck-us.net>
 <SG2PR04MB55430E53CC7229B5BB5592E7A1B1A@SG2PR04MB5543.apcprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <SG2PR04MB55430E53CC7229B5BB5592E7A1B1A@SG2PR04MB5543.apcprd04.prod.outlook.com>

On Wed, Nov 15, 2023 at 08:42:22AM +0000, Delphine_CC_Chiu/WYHQ/Wiwynn wrote:
> > -----Original Message-----
> > From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
> > Sent: Tuesday, November 7, 2023 11:30 AM
> > To: Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>;
> > patrick@stwcx.xyz; Jean Delvare <jdelvare@suse.com>; Jonathan Corbet
> > <corbet@lwn.net>
> > Cc: Rob Herring <robh+dt@kernel.org>; Krzysztof Kozlowski
> > <krzysztof.kozlowski+dt@linaro.org>; Conor Dooley <conor+dt@kernel.org>;
> > linux-i2c@vger.kernel.org; linux-hwmon@vger.kernel.org;
> > devicetree@vger.kernel.org; linux-kernel@vger.kernel.org;
> > linux-doc@vger.kernel.org
> > Subject: Re: [PATCH v2 2/2] hwmon: pmbus: Add ltc4286 driver
> > 
> >   Security Reminder: Please be aware that this email is sent by an external
> > sender.
> > 
> > On 11/6/23 19:08, Delphine_CC_Chiu/WYHQ/Wiwynn wrote:
> > >> -----Original Message-----
> > >> From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
> > >> Sent: Tuesday, October 31, 2023 9:47 PM
> > >> To: Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>;
> > >> patrick@stwcx.xyz; Jean Delvare <jdelvare@suse.com>; Jonathan Corbet
> > >> <corbet@lwn.net>
> > >> Cc: Rob Herring <robh+dt@kernel.org>; Krzysztof Kozlowski
> > >> <krzysztof.kozlowski+dt@linaro.org>; Conor Dooley
> > >> <conor+dt@kernel.org>; linux-i2c@vger.kernel.org;
> > >> linux-hwmon@vger.kernel.org; devicetree@vger.kernel.org;
> > >> linux-kernel@vger.kernel.org; linux-doc@vger.kernel.org
> > >> Subject: Re: [PATCH v2 2/2] hwmon: pmbus: Add ltc4286 driver
> > >>
> > >>    Security Reminder: Please be aware that this email is sent by an
> > >> external sender.
> > >>
> > >> On 10/30/23 23:46, Delphine_CC_Chiu/WYHQ/Wiwynn wrote:
> > >> [ ... ]
> > >>>>
> > >>>>> +
> > >>>>> +     ret = of_property_read_u32(client->dev.of_node,
> > >>>>> +                                "shunt-resistor-micro-ohms",
> > >>>> &rsense);
> > >>>>> +     if (ret < 0)
> > >>>>> +             return ret;
> > >>>>> +
> > >>>>> +     if (rsense == 0)
> > >>>>> +             return -EINVAL;
> > >>>>> +
> > >>>>> +     info = &ltc4286_info;
> > >>>>> +
> > >>>>> +     /* Default of VRANGE_SELECT = 1, 102.4V */
> > >>>>> +     if (device_property_read_bool(&client->dev,
> > >>>> "adi,vrange-select-25p6")) {
> > >>>>
> > >>>> What if the adi,vrange-select-25p6 property is not provided, but
> > >>>> the chip is programmed for this range ?
> > >>> The binding document tells programmers how to fill the dts.
> > >>> Thus, programmers must fill this property if their system is 25.6
> > >>> volts voltage
> > >> range.
> > >>>
> > >>
> > >> Sure, but there is no else case, meaning VRANGE_SELECT is unmodified
> > >> in that case. There is no guarantee that the chip is in its power-on state.
> > >
> > > The else case is in v2 ltc4286.c line 133 It means that the voltage
> > > range for programmer is 102.4 volts which is default value, so driver
> > > doesn't need to do any change for VRANGE_SELECT bit.
> > 
> > There is no guarantee that the value wasn't changed before the driver was
> > loaded.
> 
> We still can’t get your point.
> Could you tell us about your concern here?

I have repeated it several times. You are making assumptions about
register values when the driver is loaded. Those asumptions
are wrong since the state of the chip is unknown when the driver
is loaded. Any entty (BIOS, ROMMON, i2cset, some operating system
loaded earlier, or even some other driver or platform code) may
have changed those values.

On top of that, as I also have pointed out, LTC4287 supports
saving its configuration data in eeprom. That means that any chip
configuration set during production or anytime later will be
retained, meaning any assumption about chip configuration
when the driver is loaded is even more wrong.

Guenter

