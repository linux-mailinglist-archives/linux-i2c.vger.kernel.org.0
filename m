Return-Path: <linux-i2c+bounces-8546-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 887B19F3928
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Dec 2024 19:45:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC465168D86
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Dec 2024 18:45:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 980FC207662;
	Mon, 16 Dec 2024 18:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NhZBLujl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F156243AA9;
	Mon, 16 Dec 2024 18:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734374696; cv=none; b=Wphzx0vCDXqQ+78Tb4z0kMwgV0Vc0AZxNr19R+WsVTflcKmerTsFC+u1aK5rtYWafWdO70XZO62pT4i6MWsj/K4udb1W+AuQQDIPYFp8kPEjMDOYBj/YJFkGiHcVKDliwppBHp/Zth9wfX8mg8Xmeg/pFtqTnBjw4V476fMedt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734374696; c=relaxed/simple;
	bh=8xGWfOWA8TJ/ndkiGeCLPYrR80FjyNYGa5KgQMzEx68=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BoiLUna/dudRqlIjzQnu13iKcJl6pPQ1k8fdomzXOUeoWX/0bDB+HhvL9soIVAi22fiXOvKz7P2RkOlivW4wVM4o3rxH+EFzUjCvWw03a/5ar7L/BaE+kH5sO+If5NoQDi/LXKFc2zepeDXC0J0r0THkqJvjFQUC6qvpvBSB9Ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NhZBLujl; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-728f1525565so5255119b3a.1;
        Mon, 16 Dec 2024 10:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734374694; x=1734979494; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uy5TogmUO/LFZyCxZkXtCXKplw56kqYPZnvOjhju0LM=;
        b=NhZBLujlSYZ8XovKn7AHIDflnqZy95ssAtkbvJ7IkyFddic5+Jhs3nR69awOm6WG0/
         KxmXQwDhEkDk57hy9Co8sPPnSbN/gGyoy/kOHAz3NwaE96cQrZ8Tvn0yMJMRgw4BI4dT
         t+Cn06uRNq5q7iom+DdH3TeG+j5ZJ9QSj6WZU66p96uyfhtQhjxEIPpAPz8H4Rs911PK
         UwXXZKZjBBloep6Gs/dRbJ8Zs47u/djvmOvqVe8vMCUACoz/Vdn4MBC11yTzWdE682z3
         9h2o6CCuStc9vchWifVS81zPbOcrmqkqQFpvRNZAv5N/L/49wIYLgiM3EJLm9Hfli1hP
         en6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734374694; x=1734979494;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uy5TogmUO/LFZyCxZkXtCXKplw56kqYPZnvOjhju0LM=;
        b=ZVbkTNPsL0NRsibqywfKhZCnkkMwhPu0z/jCAlur06IFgEIjtDNJQwH1df+dgrMkUK
         d4SrdtSn4V51pzcPGKnr129Zf4MAVNWLtoiICt/yhfaAOosC5sdTDVVv5q+lDQ64Hkuz
         DsMpJfDN8gehLBAhB/I93745fJSwmXjXa2RbBD0mBEQi/TO7m9FMme1eC/txZ6M/AIO6
         Q9+UjEAohCtY71fdOXyewVg51MREjHaFX0rXVcgf+JUCmxWdfq3nVbSAuBq9Oo9wJ1Kk
         RfP+uGlr7aKBFPTFF3/EEJWU13pBh/qjjYDpDhvko/ADSvETfOqDJGZJSelaiOt0REG9
         ZJMg==
X-Forwarded-Encrypted: i=1; AJvYcCUr+K9ctsNfRu+1qtRY8XKD+4tequucCBYjhWFJ/3ep7SaWBpuWSjtezE1+hQOqiz/BWjYw/pDZ1ELYWIHW@vger.kernel.org, AJvYcCVQstoWh1BZZnxflnfQ7N0Lgrt/Lyf+nZxna1gvsDtTQRCpjdTBJ6l0buPSDR/pY9FzNHw9kLxbnKbm@vger.kernel.org, AJvYcCWUXfbdcaEdGvEvvQuRBicD7TKNogk1NSnIA1pvsb0tT02WgRvCtX3xA99AAc35nURo6dWvJnnAFM8/@vger.kernel.org, AJvYcCWlJBRyFVpzr5iQul6OI2LYGZVrIyoL/ys0HL/3LAwgX8FTJyduHJ56xCIEx+ZJzgVDpF4LYu+FQoNymqg=@vger.kernel.org, AJvYcCXuxtYh+dZrz9cCxLC0GL5UMp74MV1rFpd0B8ecClvVUT2dzYSjI9FS0cl+TrNboZpVWnC8PLEAtGCx@vger.kernel.org
X-Gm-Message-State: AOJu0YyjyFRcRPrmtF+0cw4P5FPYkRyYw6F4RflnU7lJGDUgYhSuRWOr
	uNxdd1qsdcb4yw89kcd1AkSetvj9YDA0MBSQ+r6ZP/EcM24b2LrLR+wDpQ==
X-Gm-Gg: ASbGncuwSp0o16bKfJ2by2SIKpEl840bqFaMo/UobFJw5F8eg6D2wYvUlQKnzMOA/fX
	PzP3h7xsB6UqHzcJfxZvnYtINqyvXQzT3X7r8Gck3AvkWODTdKKhy5vw4XEGsVF16PDI90UpTRr
	ODOTk66JehTsiWJYaNhasbRRB776g+OxeJiphUbhYRSGer9gfx7rhY7GlrJfOBU6G/JecVQw4lt
	0M9yU9juh+UWOhlBpsXcNheUdT3qam8AxBkmmOCBawOpbbaJndRHku+0occCSzzo2e38g==
X-Google-Smtp-Source: AGHT+IG8e6Gmq7DkH/m0iRUYm3sVxn3mLoxGSYH+9VbhyIOnW1xJl8bcqkbPbHMff/wOuKaIzC7VKA==
X-Received: by 2002:a05:6a00:419a:b0:725:b1df:2daa with SMTP id d2e1a72fcca58-7290c248bebmr22022737b3a.20.1734374694201;
        Mon, 16 Dec 2024 10:44:54 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72918adbc76sm5082337b3a.80.2024.12.16.10.44.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 10:44:53 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 16 Dec 2024 10:44:51 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Ninad Palsule <ninad@linux.ibm.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	eajames@linux.ibm.com, jdelvare@suse.com, corbet@lwn.net,
	joel@jms.id.au, andrew@codeconstruct.com.au,
	Delphine_CC_Chiu@wiwynn.com, broonie@kernel.org,
	peteryin.openbmc@gmail.com, noahwang.wang@outlook.com,
	naresh.solanki@9elements.com, lukas@wunner.de, jbrunet@baylibre.com,
	patrick.rudolph@9elements.com, gregkh@linuxfoundation.org,
	peterz@infradead.org, pbiel7@gmail.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 1/4] hwmon: (pmbus/core) Add PMBUS_REVISION in debugfs
Message-ID: <6604eea3-de0f-4d2e-bc12-7f75012b949e@roeck-us.net>
References: <20241216175044.4144442-1-ninad@linux.ibm.com>
 <20241216175044.4144442-2-ninad@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241216175044.4144442-2-ninad@linux.ibm.com>

On Mon, Dec 16, 2024 at 11:50:39AM -0600, Ninad Palsule wrote:
> Add debugfs file for the PMBUS_REVISION command. This command provides
> information about PMBus protocol revision number.
> 
> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>

Applied.

Thanks,
Guenter

