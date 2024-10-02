Return-Path: <linux-i2c+bounces-7191-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4615798DE11
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Oct 2024 16:57:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6EB141C245DA
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Oct 2024 14:57:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 306D51D04A8;
	Wed,  2 Oct 2024 14:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O9ShA8IF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F1479E1;
	Wed,  2 Oct 2024 14:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727880982; cv=none; b=RAW655ooXoJcbv9dREOfMw06owXsEpz7MLilqMZPxvCQyse1q7FUgUwv8B7ghiRU12blQuDsZgmSXIGJ8UJHx0zMqFzVbtOqZ/A/m1ri/kWCRFWgs6TVSa8IP0GBnaKhMci3MNHTOhm7UHWA188Ntbu4edU8jQu3cwMtio6wpPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727880982; c=relaxed/simple;
	bh=0PMHnOfLINOpUpL5u52xj7l7dUhjRThgwDNabUf2iLc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DIV6u3sj1FrE/JvWue8sL5E5FoOmNYlxudgqs3Rh30HOgv7iPGGMalpRK+dqZfODaybsebIHyt8fqhcXv8H96JKU4Bi9AMhhS+erRb+M11/jPLfWC/CpfsZHz+y5mAi+csz8janEQqoE0aYmRBn1ctK3rrZbYGNe96m9XiPr7mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O9ShA8IF; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-42cbc22e1c4so51393635e9.2;
        Wed, 02 Oct 2024 07:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727880978; x=1728485778; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ArJKboNdEUouLVjZmQiavzaztbu9wUmpBbz3Qd2ETsk=;
        b=O9ShA8IFA0M3cUltJOkhsiKw/gx0md09CmqkUIuhxsggb0VqEIA2BoMsDitlXOWrM+
         zLYz7xr1xLTrzfW3R2NTwZcCrqbtkQ/55h5XSHCYV02dwbHZIJXb3TfIY25q8k1vk/Dl
         nsKeHnHIyL45MyejyFaTve5a65nXHqkeFY31OsKh1jRS8JFFRE3Y9/v4mlRJxlvWolql
         ODoqQTeHqHSwUSpbnv/6tB2nh6b8QIrrmHPe6ftK8Pq5Vokrwg3g/0gA/C6OhjGky80Q
         0tjuvVwxq1+odquSOR1YthfigZz/NVtNCcRVjdBS+77QxixlobaRC+B1Vp59QjKSxLsh
         7F+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727880978; x=1728485778;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ArJKboNdEUouLVjZmQiavzaztbu9wUmpBbz3Qd2ETsk=;
        b=Ryfho4HdbuOBqqH1Md2sBZ1WYN/NEHZrDZ8iDSFtOduiF/DA/v3UmhXx5FE8Rfu83A
         kXJrNo7Fu7nGcX5dHsywhGP8bXjjR2I3j9ZQPuQSA+ZQ7Nn0W2DbdJztOo6WlsdUmRqz
         /Mx5RIfM7Km/vXMGVCwZHfRXEesEYuZuorb6A3PvZ2CTjlDySAG9qrRHRRm64LvtD3Uu
         ZMBP/MC+bXggytk0w4xzOtGHSBn0GBD7AvKD9yWrdeQvPVOgv4tIsNHkuo4p5kAe1rox
         SAcuR2x/N4uBnF/GZSCyPYxYiFwsoAn48HqmJqxbzxV34dOWtNNH5NloW9TpDvdjF86V
         8TmQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6vS3m610rHbjFxCWzVvET71t9HKfz6pxbVy8stqvetxL1DqZWoj1e59EZuepXaDJk88WG9bPTKFg=@vger.kernel.org, AJvYcCVSSjHVBdXaHYlDKKxwS2uJiWL7qsuBdIcyuTFWVpCs2j0MgK0sYVtYVYxMJt9zPX+sP1UendA4zdTr8MVU@vger.kernel.org
X-Gm-Message-State: AOJu0Ywxi0lo7Sya0O+J65ISY6oC5JIr+/Kfd4qsdRoSfWOoYenerdli
	F9eeShj08VQGTr5s3lQnGnfFLN6psa+qWmB96/Jy4aeh0B9FYRY4
X-Google-Smtp-Source: AGHT+IFSuWZxPxnR/PCz++pS/3Tgv8+0dPn8oiXivA0TR+4KO3wJwURaFqD7P8uc0QGMdxkXk/UdBw==
X-Received: by 2002:adf:eece:0:b0:374:c8d1:70be with SMTP id ffacd0b85a97d-37cfba0a47fmr2127521f8f.38.1727880978326;
        Wed, 02 Oct 2024 07:56:18 -0700 (PDT)
Received: from eichest-laptop (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd564d5b7sm14222365f8f.5.2024.10.02.07.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 07:56:18 -0700 (PDT)
Date: Wed, 2 Oct 2024 16:56:16 +0200
From: Stefan Eichenberger <eichest@gmail.com>
To: Lucas Stach <l.stach@pengutronix.de>
Cc: o.rempel@pengutronix.de, kernel@pengutronix.de, andi.shyti@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
	Frank.Li@nxp.com, imx@lists.linux.dev, linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	linux-i2c@vger.kernel.org, francesco.dolcini@toradex.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 1/4] i2c: imx: only poll for bus busy in multi master
 mode
Message-ID: <Zv1fEAFKlzNpmHnD@eichest-laptop>
References: <20241002112020.23913-1-eichest@gmail.com>
 <20241002112020.23913-2-eichest@gmail.com>
 <6378933c8d30bec2c3084e41c83b9d129d0d40d1.camel@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6378933c8d30bec2c3084e41c83b9d129d0d40d1.camel@pengutronix.de>

On Wed, Oct 02, 2024 at 04:40:32PM +0200, Lucas Stach wrote:
> Am Mittwoch, dem 02.10.2024 um 13:19 +0200 schrieb Stefan Eichenberger:
> > From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> > 
> > According to the i.MX8M Mini reference manual chapter "16.1.4.2
> > Generation of Start" it is only necessary to poll for bus busy and
> > arbitration lost in multi master mode. This helps to avoid rescheduling
> > while the i2c bus is busy and avoids SMBus devices to timeout.
> > 
> This is a backward incompatible change, as far as I can see. Until now
> the driver would properly handle a multi-mastered bus, without any
> specific configuration. Now it requires the new multi-master DT
> property to be set, which isn't even documented in the binding to be
> understood by this driver.
> 
> Are you sure that every single instance of a i.MX i2c bus is only
> single mastered?
> 
> If this is a worthwhile performance improvement I guess you need to
> flip the logic around by adding a new single-master DT property (or
> something along those lines), which should go through proper DT binding
> review. You can then use this property for boards/busses to opt into
> skipping the arbitration lost check.

According to the discussion here the property documentation should not
be added:
https://lore.kernel.org/linux-i2c/2bbddaxyjkxfmlgmq3yqcbzo7dsb2pq5bvdatk2y4ig4iintkt@35btqkdv7sy3/

However, the point regarding single-master and multi-master is correct.
We also discussed this internally and assumed the single-master use case
is more likely to be the default and that this patch series would fix
issues for other devices out there. However, your point is valid and if
preferred I can change it to single-master with the next version.

Francesco Dolcini <francesco.dolcini@toradex.com> I think you once had a
discussion regarding multi master mode for i2c on i.MX devices? Maybe
you can remember the details?

Regards,
Stefan

