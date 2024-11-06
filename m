Return-Path: <linux-i2c+bounces-7844-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 585029BF252
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2024 16:57:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7BE571C21C18
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2024 15:57:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CA50204F74;
	Wed,  6 Nov 2024 15:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cJLxwqFK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00C62038DA;
	Wed,  6 Nov 2024 15:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730908660; cv=none; b=jqIRBBM5paEHRa8Q9TrYTFBJezMIf5bbAbz+fJ0BLEjri+YH7gv6Nj2jlWdDU4VEtYB3+1oRDBLSNbhEGvtuPYfASnS1mnj+t0FF3uNymJRyxRpagGz5domr3YPo8iUDLPX0LyAI2/thp8F7yBogEU43Dx226cuwCnCHOwk+8Ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730908660; c=relaxed/simple;
	bh=4yjgRkQZgHZKcliYPj1E9Ufomuv2mAshunnuZm5XMgY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ptNL4Y6faE+YPm3ei8XghoHLhL5G7jAR7oGJp3Yas1+UWV6RkYsIZNgH/Ovczy/jwvxMgL5V6vp9HS63JBQhjgUhbDJZIeDEQ3Y9Xr5gmcXiZoM23zDWJzyTzJvEVPtZPhJH029IfIeTSKi4Um1ukzGMjBJgz/Er826YPMAsSHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cJLxwqFK; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-20ca1b6a80aso72618495ad.2;
        Wed, 06 Nov 2024 07:57:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730908658; x=1731513458; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qeexoxW0OuVyCzdaxuaC2uS39PI6PDQIATA6gVmSM8A=;
        b=cJLxwqFKMiskDUJCH6uETDUeEH1R6/S5nj8dImK/pitt8FY+vrVIQfVWxXAXdiAt4S
         wnrDC4pVNx3Dlf5t5er+yxwI2Bdi4H6Trt6up1DotypWU/LTmQzlKZEdAQYEfC7clNKn
         vkNm9+fctvUr2rKgJnoSlj0P2F9CE9V3rIsb54ZWe0tDx0frmB1OhbYGTAsAKCaVLo2V
         KMCoN9TY3QwSz5cFJHyBx/1HvzshStoqnPL5YOPmieCzadOqH5KKbh/WD/bPbCAKxkFv
         qVf/+NeqJFe+5aVOhIm1acw7G6wMilQljT+/UShXeuv/m8eO1Drz93gPnSfjJ0+cBH+V
         UrYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730908658; x=1731513458;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qeexoxW0OuVyCzdaxuaC2uS39PI6PDQIATA6gVmSM8A=;
        b=T0tbc3XmZtpyaKufqqWBxi2VsR+TFz+D7VtFd2AcSi/vxWl+LoJESt+PJGKSV67wmd
         AY1NLzSys7gbX6uwg8pUiJa1lhtDpwoWNmQL6NW4E1pBDIJ29Zd7KJEBrLgJSmckE6XV
         JqNz+xNSIPnD1rO7PELSHiZJP51xvhC2KhPRfIvuPedKzhSqe6Ogqs9CBR5+hs3N0Fxw
         lod3XfVaZt24bZre51Cb8vPBR7tAnnm3yAu6j1vm8YaM+ULoXEdZ45R+gqV6+GRVsQW0
         CcQVl16VpPtaT/4ioRV9VGLtQhQsiDN4tQWKpI+SY16yjA5wE1j3q+NUsUVEiSi43Rnq
         8HDg==
X-Forwarded-Encrypted: i=1; AJvYcCUxALiQxa8RjtIAF/e1ulXF8+TkEZ7nh2311wGpBPTjaB5HzDzd2UzTZ64gFDFr0HmHX2U2rVCQDt1YkID5@vger.kernel.org, AJvYcCVAtSSJc/4WeHUqw4NPXAg8Q38+NW4i3sEtLON/YIcQwHtQeMadbf0+Oerk0ymzbvWhxc5QBHHMobl7@vger.kernel.org, AJvYcCWmQSYDgiRjeZW0OTbvVcm0QlA0BDAJDMHCZrnxvpX7om7s9Dx/6dZcyGGwcjoEaYJY0ERvlG0bqnpL@vger.kernel.org, AJvYcCWzAuv0RoN2yVq8tNnNmvhwQC/f/jXNYg2v09Af3j1kB8wpGujjNKPkCjCL2Rj7s0j1CJPiildaOiFzWyE=@vger.kernel.org, AJvYcCXUN8zVKmXz08t15NpzPWLwtdUocYE2LDObiNhuTLWjI1bEu9rt1iVJ9EuPHl23t1f4NDlUgRSHGxQn@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ9QXnEmLUvFaoPPwQY/SspUtf9dvjg9oYnYLWCdZpV9M3faXk
	hPr+45RyMRdIhG7rAt9arhMUjVwYxZ3BzEypL09B3DbHzADw2KB6f1fHPA==
X-Google-Smtp-Source: AGHT+IG7ihs+ud0gGzF7qPyVzpWAStK6eSCUhP/JN3OGpY5JAV3WfOI4iSuLENUKxL4Xd8Sp7nEZ2Q==
X-Received: by 2002:a17:902:f78a:b0:20c:6bff:fcae with SMTP id d9443c01a7336-2111af1762bmr268484875ad.5.1730908657948;
        Wed, 06 Nov 2024 07:57:37 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2110570815bsm97544365ad.91.2024.11.06.07.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 07:57:37 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 6 Nov 2024 07:57:36 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Patrick Rudolph <patrick.rudolph@9elements.com>,
	Naresh Solanki <naresh.solanki@9elements.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v4 1/7] hwmon: (pmbus) add documentation for existing
 flags
Message-ID: <34f29ad5-4c31-4091-ad59-fa229ccd78bc@roeck-us.net>
References: <20241105-tps25990-v4-0-0e312ac70b62@baylibre.com>
 <20241105-tps25990-v4-1-0e312ac70b62@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241105-tps25990-v4-1-0e312ac70b62@baylibre.com>

On Tue, Nov 05, 2024 at 06:58:38PM +0100, Jerome Brunet wrote:
> PMBUS_NO_WRITE_PROTECT and PMBUS_USE_COEFFICIENTS_CMD flags have been added
> to pmbus, but the corresponding documentation was not updated.
> 
> Update the documentation before adding new flags
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Applied.

Thanks,
Guenter

