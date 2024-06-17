Return-Path: <linux-i2c+bounces-4054-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F220C90A627
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Jun 2024 08:54:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A662C1F21D59
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Jun 2024 06:54:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25F661862B8;
	Mon, 17 Jun 2024 06:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="feMhCKU3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333F91862B2;
	Mon, 17 Jun 2024 06:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718607239; cv=none; b=pY/Zsx+ifN2hH1wbLE6XvVD5Bm5dRD0KUAvGruSPFmLzhvbpV+GDde341PDaF1N4QZS8aervGbu9bhiRPV6DwcFwITBPbr/qh9pTu5ptrYzkXc5/I9GjbMlPQsKRmKrG15HHhFlkrDmbAmkVBmrQBf2uloBSGKYd7pf2YuqXZjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718607239; c=relaxed/simple;
	bh=dLFwFlAIk4z0C0fXgwrHSy8G/0Byf5WPY3JWlgwCQyk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qriEVIk3YacC8mSkQo0+/c+kBgav2dLnK7Y5D1VNHegN1WIpp7jflSyascxnntJMBoHzi0XEteWpE/18T6UGpXkbUpBsgHIblnpzSLKxgocSlNf+A/eKILkOsiq8Vi0x7R4OCkwUEPl8Srv9bzrjLB5TBLtpOE0BgAhyalu1+QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=feMhCKU3; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1718607237; x=1750143237;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dLFwFlAIk4z0C0fXgwrHSy8G/0Byf5WPY3JWlgwCQyk=;
  b=feMhCKU3sgnyC4lm+RHZfNF58y6XFGc78I9PRs27L2b+bXZVCIbC0FFA
   b26tbT4ydFG4u+eke8i+shEagyqj5FfaeIaPZ2t3uqKRoHr9D1vxvDxd3
   AUtmVwN4k26AGgTR/YYzsz0egPZ8db2i+t2Lfm61hPFXuNdzaxKGZognN
   nCfPdQOPBFVnuzEVJB7usZdZzA7g3rnucIftTDe9fGcFC0BNLqnMsc63M
   DnAwHgH7RKE0Bb4b5FS+fw9kNYXUhKW1FrbGHVwOxdYi8fYNHe922WC2B
   X3tQLUS9YmxUiP2CnW5RW11Ay0+udGyBoMXkraGGARbwhZTDDaPLlwxUL
   A==;
X-CSE-ConnectionGUID: b+UnrsvmSiC7oX8y7/U5Iw==
X-CSE-MsgGUID: 1Ax2uC8MT9WUmYkGXNWXUA==
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; 
   d="scan'208";a="28481392"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 16 Jun 2024 23:53:50 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 16 Jun 2024 23:53:40 -0700
Received: from ROB-ULT-M76677.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Sun, 16 Jun 2024 23:53:38 -0700
From: Andrei Simion <andrei.simion@microchip.com>
To: <bgolaszewski@baylibre.com>
CC: <claudiu.beznea@tuxon.dev>, <arnd@arndb.de>, <gregkh@linuxfoundation.org>,
	<linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] eeprom: at24: avoid adjusting offset for 24AA025E{48, 64}
Date: Mon, 17 Jun 2024 09:53:26 +0300
Message-ID: <20240617065326.17010-1-andrei.simion@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CAMpxmJWrXSU8i1O8+dwuSLksNsiGXRWGEKCb93kVYFt1b06n1Q@mail.gmail.com>
References: <CAMpxmJWrXSU8i1O8+dwuSLksNsiGXRWGEKCb93kVYFt1b06n1Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

On Tue, Apr 13, 2021 at 1:03 PM <Claudiu.Beznea@microchip.com> wrote:
>
> On 12.04.2021 21:29, Bartosz Golaszewski wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >
> > On Mon, Apr 12, 2021 at 9:42 AM <Claudiu.Beznea@microchip.com> wrote:
> >>
> >> On 07.04.2021 21:37, Bartosz Golaszewski wrote:
> >>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >>>
> >>> On Fri, Apr 2, 2021 at 3:24 PM Claudiu Beznea
> >>> <claudiu.beznea@microchip.com> wrote:
> >>>>
> >>>> Some EEPROMs could be used only for MAC storage. In this case the
> >>>> EEPROM areas where MACs resides could be modeled as NVMEM cells
> >>>> (directly via DT bindings) such that the already available networking
> >>>> infrastructure to read properly the MAC addresses (via
> >>>> of_get_mac_address()). Add "atmel,24mac02e4", "atmel,24mac02e4"
> >>>> compatible for the usage w/ 24AA025E{48, 64} type of EEPROMs and adapt
> >>>> the driver to not do offset adjustments.
> >>>>
> >>>> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> >>>> ---
> >>>>
> >>>> Hi Bartosz,
> >>>>
> >>>> For the previously available compatibles the offset adjustment is done
> >>>> (probably for compatibility w/ old DT bindings?). In my scenario 24AA025E48
> >>>> is used in setup with macb driver which is calling of_get_mac_address()
> >>>> to get the proper NVMEM cell in EEPROM where the MAC resides and read
> >>>> directly from there. We modeled the EEPROM and NVMEM cell in DT as
> >>>> follows:
> >>>>
> >>>> &i2cnode {
> >>>>         // ...
> >>>>         eeprom0: eeprom0@52 {
> >>>>                 compatible = "atmel,24mac02e4";
> >
> > Can you point me to the datasheet for this model, google only directs
> > me to this very email.
>
> This is the datasheet:
> https://ww1.microchip.com/downloads/en/DeviceDoc/24AA02E48-24AA025E48-24AA02E64-24AA025E64-Data-Sheet-20002124H.pdf
>
> >
> >>From the device tree it looks as if it was just a regular 24c02 EEPROM
> > with MAC hard-coded at 250-255 bytes, is that right?
>
> Yes, the MAC is hard-coded at 250. But using "24c02" compatible will
> involve the offset adjustment in the driver (let me know if I missed
> something).
>
>
> Something seems to be wrong. There's no offset adjustment for "24c02".
> Have you tried running i2cdump on the EEPROM's address? Do you see the
> MAC?
>

Hi,

I'm trying to revive this thread. 

Yes, I see the MAC using i2cdump for both: eeprom0@52 and eeprom1@53 from 0xfa.

PS: I will send a new series to include these new compatible into DT binding document, all rebased on the current rc.

Best Regards,
Andrei Simion

> Bartosz

