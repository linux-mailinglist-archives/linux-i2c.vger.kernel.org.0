Return-Path: <linux-i2c+bounces-9452-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 391A8A351A1
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Feb 2025 23:52:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 87EAE188FCB9
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Feb 2025 22:51:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A2B62753E7;
	Thu, 13 Feb 2025 22:50:36 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from fgw20-7.mail.saunalahti.fi (fgw20-7.mail.saunalahti.fi [62.142.5.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A5622D797
	for <linux-i2c@vger.kernel.org>; Thu, 13 Feb 2025 22:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739487035; cv=none; b=XVjhoTSCeVsKglfxpfedvWK55oiEdBn9EituCc2xzsRTs6dtRmvQ4Df9asDOgNJ9OyTm4vckHp8kKG8H9ZNg62Eq89YmW50M6sijkD9KynNY/P0L8YStXDgmbWLxtAFPs15HboL/vFEi68ygEr5SwuDdSDje6rM85a73UgjygGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739487035; c=relaxed/simple;
	bh=S82i4vGj6R1U5IsQWK+bhits1yoU7F2bx83mR9VBT6w=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Of2eHN/+t0aNl91zDXAHDInJti1UbPlC0A6haG9DoIHiUoyZOJL7ZzJWdXcJPiqlzTSSw+ExM8rA2hr3/kIyyw0fBbf7MTY+p8erlDJ2Tz0dQ3W2KRCj57TywyusofAwNOoIIbheWH8iwb8qTAckS4kw43n38TMGxuRpJ2TYdqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-232.elisa-laajakaista.fi [88.113.26.232])
	by fgw20.mail.saunalahti.fi (Halon) with ESMTP
	id ed3944a9-ea5c-11ef-9d70-005056bd6ce9;
	Fri, 14 Feb 2025 00:50:30 +0200 (EET)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 14 Feb 2025 00:50:30 +0200
To: "20241010025317.2040470-1-aryan.srivastava@alliedtelesis.co.nz" <20241010025317.2040470-1-aryan.srivastava@alliedtelesis.co.nz>
Cc: "Markus.Elfring@web.de" <Markus.Elfring@web.de>,
	"andi.shyti@kernel.org" <andi.shyti@kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v10 0/2] i2c: octeon: Add block-mode r/w
Message-ID: <Z653Nn_UO47pgRj8@surfacebook.localdomain>
References: <20241010025317.2040470-1-aryan.srivastava@alliedtelesis.co.nz>
 <77e95bcdbb1cb986686487d777f8966dca0cf435.camel@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <77e95bcdbb1cb986686487d777f8966dca0cf435.camel@alliedtelesis.co.nz>

Mon, Nov 11, 2024 at 01:36:22AM +0000, Aryan Srivastava kirjoitti:
> Hi Andi, did you have anymore comments for this patch series?

I have comments. Can you address them, please?

-- 
With Best Regards,
Andy Shevchenko



