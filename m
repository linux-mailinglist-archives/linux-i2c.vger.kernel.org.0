Return-Path: <linux-i2c+bounces-11385-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB79AD79E1
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Jun 2025 20:45:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BBB9F3A3865
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Jun 2025 18:45:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28E1129B8CE;
	Thu, 12 Jun 2025 18:45:25 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from fgw22-7.mail.saunalahti.fi (fgw22-7.mail.saunalahti.fi [62.142.5.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 349202D29AE
	for <linux-i2c@vger.kernel.org>; Thu, 12 Jun 2025 18:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749753924; cv=none; b=m5WScGMF5p7Yau4GUwVrR02kReVwbTBilKF0KLXbJbekrra+V3aaubiTOCbjRzhDcdbwduA5K5ZhUzKEkkSilJX1XshBQ77WG40Ox+Ur75y6hpd68oP884XBrkVccGvGyVm87WKQLqPqFR+UpRZMAFLGbpqp4gVYYdCPpL9BT78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749753924; c=relaxed/simple;
	bh=AM/CMJfK0GYiU4RCv8jWMyfn/lCdgsfSJwTNeIpKM2k=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Usad3H9F8QN8DOPew+tSerboKg+SNat3glOl2z972YkNL7PSYVNF7lg+c5DQaNgFFkoq6QsYDE0zi7QCclYvOmubKQutAGTnWhlCm3j1SlnlneNhP3kWC0ryn5VCzzB2vixvi9wLd9Dy1BDTKsS35bcz6SIHBg0nOQZORcvQkb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-232.elisa-laajakaista.fi [88.113.26.232])
	by fgw23.mail.saunalahti.fi (Halon) with ESMTP
	id 320ce3ed-47bd-11f0-a97c-005056bdfda7;
	Thu, 12 Jun 2025 21:43:56 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 12 Jun 2025 21:43:56 +0300
To: Akhil R <akhilrajeev@nvidia.com>
Cc: andriy.shevchenko@linux.intel.com, andi.shyti@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org, digetx@gmail.com,
	jonathanh@nvidia.com, krzk+dt@kernel.org, ldewangan@nvidia.com,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org, p.zabel@pengutronix.de,
	robh@kernel.org, thierry.reding@gmail.com
Subject: Re: [PATCH v4 2/3] i2c: tegra: make reset an optional property
Message-ID: <aEsf7Ml__JE1ixQX@surfacebook.localdomain>
References: <aErOOSxt0ovCIeSA@smile.fi.intel.com>
 <20250612153338.68829-1-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612153338.68829-1-akhilrajeev@nvidia.com>

Thu, Jun 12, 2025 at 09:03:38PM +0530, Akhil R kirjoitti:
> On Thu, 12 Jun 2025 15:55:21 +0300, Andy Shevchenko wrote:

...

> >> >     if (handle)
> >> >             err = acpi_evaluate_object(handle, "_RST", NULL, NULL);
> >> > -   else
> >> > +   else if (i2c_dev->rst)
> >> >             err = reset_control_reset(i2c_dev->rst);
> >> > +   else
> >> > +           err = tegra_i2c_master_reset(i2c_dev);
> >>
> >> Can you please take a look here? Should the reset happen in ACPI?
> >
> > This is a good question. Without seeing all the implementations of _RST method
> > for the platforms based on this SoC it's hard to say. Ideally the _RST (which
> > is called above) must handle it properly, but firmwares have bugs...
> >
> > TL;DR: I think the approach is correct, and if any bug in ACPI will be found,
> > the workaround (quirk) needs to be added here later on.
> 
> As in Thierry's comment, I was in thought of updating the code as below.
> Does it make sense or would it be better keep what it is there now?
> 
> if (handle && acpi_has_method(handle, "_RST"))
> 	err = acpi_evaluate_object(handle, "_RST", NULL, NULL);
> else if (i2c_dev->rst)
> 	err = reset_control_reset(i2c_dev->rst);
> else
> 	err = tegra_i2c_master_reset(i2c_dev);

This will change current behaviour for the ACPI based platforms that do not
have an _RST method. At bare minumum this has to be elaborated in the commit
message with an explanation why it's not a probnlem.

-- 
With Best Regards,
Andy Shevchenko



