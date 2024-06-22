Return-Path: <linux-i2c+bounces-4268-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E71179136C2
	for <lists+linux-i2c@lfdr.de>; Sun, 23 Jun 2024 00:50:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A48AE283806
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Jun 2024 22:50:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 830454C631;
	Sat, 22 Jun 2024 22:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tY9A+EFl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B101D524;
	Sat, 22 Jun 2024 22:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719096629; cv=none; b=URjscXKkY52u3XuLitZy16EsEJQAWV2HPDoq1L3JOGzGLSnCx0rFo91JcFWYWO6gV2YKMEAceADTKx4HhCoUA/K12SSyahJhZ2FC21nBb8/KPO2Xs5pfPVsRZArxIELS7ZYW3dUNRrI0ROTkOFEaXUUyhGPlyeTwXBEO7ogO+6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719096629; c=relaxed/simple;
	bh=H1IW617Uo64bFM0QGtbz6/be4zV4VSsI9UXdD0IZS34=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=InQ1FVZ7xi5qvU0/pPgNlkYrJHit2z2bxWiPF3KpQFulbjYuIE/SPOpBwT18KE4mr6V9ZGyuvcn3xxmyvTtIwvuWaaCl2i6H8K6fYgh5G773+K1jEdQ/k+hB+21//5ozrfPp+uu/veSlxVO/2oQF54PCQzYG/AWubxuvZiNNBEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tY9A+EFl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C7E3C3277B;
	Sat, 22 Jun 2024 22:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719096628;
	bh=H1IW617Uo64bFM0QGtbz6/be4zV4VSsI9UXdD0IZS34=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tY9A+EFl3GNmE1Fvhb8VqWjHi9hYCXBMGKrGSTJFccfqTd5YANcPpCGFBP1kZiLoh
	 yG5qX45mLVFmEmXLwLY+ldfAiLvSWCB5YK5UiKrr9B07n/1S+No15nP+hwq3+Pxhwi
	 sLyzU4ob4+sQQdXBmd8N1C3FjSqaw0XQKJkeKbzsTfiwb29qgjYKs9iAnfO9VsC/rj
	 0qHKAGM44Fy2ThhbihfWjcyPUwRiwPYf5Z2hG4G6q1iCiB3Q/EFU50jA2yrY7v4JmA
	 jEVZgTSRdiLZbEC/y9lT462M1al1vjWluh8xjjSxxglbiuF4gUJZhmDUMIOO6f4vl1
	 SfTsvs6x9CCLw==
Received: by pali.im (Postfix)
	id 49BD464C; Sun, 23 Jun 2024 00:50:25 +0200 (CEST)
Date: Sun, 23 Jun 2024 00:50:25 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Paul Menzel <pmenzel@molgen.mpg.de>, Wolfram Sang <wsa@kernel.org>,
	eric.piel@tremplin-utc.net, Marius Hoch <mail@mariushoch.de>,
	Dell.Client.Kernel@dell.com,
	Kai Heng Feng <kai.heng.feng@canonical.com>,
	platform-driver-x86@vger.kernel.org,
	Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v3 3/6] platform/x86: dell-smo8800: Move instantiation of
 lis3lv02d i2c_client from i2c-i801 to dell-smo8800
Message-ID: <20240622225025.s7tbfb66pnhavqw2@pali>
References: <20240621122503.10034-1-hdegoede@redhat.com>
 <20240621122503.10034-4-hdegoede@redhat.com>
 <20240622131650.qxoxtp6aaitpar6a@pali>
 <ffbb42d9-f6c6-456e-8427-0c75c2a2e90d@redhat.com>
 <20240622142015.7cfl2onabpr6kl6r@pali>
 <20240622164349.fycelzxcd45j4g22@pali>
 <CAHp75VdVhiMN7TN-OwF=9ahv9W-2Yk+k=V5DvQGhTpUuR-b-xg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VdVhiMN7TN-OwF=9ahv9W-2Yk+k=V5DvQGhTpUuR-b-xg@mail.gmail.com>
User-Agent: NeoMutt/20180716

On Sunday 23 June 2024 00:43:17 Andy Shevchenko wrote:
> On Sat, Jun 22, 2024 at 6:43 PM Pali Rohár <pali@kernel.org> wrote:
> > On Saturday 22 June 2024 16:20:15 Pali Rohár wrote:
> 
> ...
> 
> > Definition of the table can be simplified by defining a macro which
> > expand to those verbose parts which are being repeating, without need to
> > introduce something "new". E.g.:
> >
> > #define DELL_LIS3LV02D_DMI_ENTRY(product_name, i2c_addr) \
> >         { \
> >                 .matches = {
> >                         DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."), \
> >                         DMI_MATCH(DMI_PRODUCT_NAME, product_name), \
> >                 }, \
> >                 .driver_data = (void *)(i2c_addr), \
> 
> I'm not against this as we have a lot of different examples similar to
> this (with maybe other types of ID tables). But what makes me worry is
> the use of (void *) here. Shouldn't it be (const void *) so we exclude
> the (potential) cases of dropping const qualifier?

I do not know what is the best way here for casting short int to void*.
For me it looks strange if such casting is needed. Anyway I think that
in any case casting 16-bit short integer to const void* does not produce
different result as casting to plain (non-const) void*. It is not about
const qualifier but about integer-to-pointer cast, where is dropped
everything to that integer type.

> >         }
> >
> > static const struct dmi_system_id smo8800_lis3lv02d_devices[] = {
> >         DELL_LIS3LV02D_DMI_ENTRY("Latitude E5250", 0x29),
> >         DELL_LIS3LV02D_DMI_ENTRY("Latitude E5450", 0x29),
> >         ...
> >         { }
> > };
> >
> > Any opinion about this?
> 
> 
> 
> -- 
> With Best Regards,
> Andy Shevchenko

