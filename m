Return-Path: <linux-i2c+bounces-3275-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B838B4D01
	for <lists+linux-i2c@lfdr.de>; Sun, 28 Apr 2024 19:03:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE76F1F20F89
	for <lists+linux-i2c@lfdr.de>; Sun, 28 Apr 2024 17:03:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 454EC73176;
	Sun, 28 Apr 2024 17:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CBfnWpyU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32AB71B47;
	Sun, 28 Apr 2024 17:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714323776; cv=none; b=u+WKpwr0mmjxagDch1LpQPyg+Mxpu/VXxprYHu9dzQWH//Uc8tdajKwTMbjUAbBXPyL8SoQ453LtI5jdSuwCwPKYWEbIYT6vcZU8g/Di2L4YFDnOlnivbRenz1XZHOn2p5qgjWWhOK5Xxt3ON7Hz73NXTQze187UcTehosDePVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714323776; c=relaxed/simple;
	bh=cbX2jp58Rs8D+XeacOcLhhTBx24MTHzSQL6GFa2L584=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WgvEDjxOQ79GqezEenkIEHlv3bFiTvKgdP7+yNie024BL+DR3nKHCJpWIdt6pLi0InY/h1vMD52eUXtZfqQ4BYQ4q3J9IuWPXM9ZnTMTK/X0XAMkwVk50ca3K5o05CN5OamSiFmqrEdxrdKWvtsg9/emdZBMPv8/CqJ1TbUyxNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CBfnWpyU; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1eab699fcddso27897405ad.0;
        Sun, 28 Apr 2024 10:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714323774; x=1714928574; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HVb/istOOFF+rmWyt8gQSKE0pFXyJo+EVF5zHPmzDI4=;
        b=CBfnWpyUnOrsQRqwPDv7Y0JuIZvzqVYSDQ+QzaTVua5kTGn2+g+t/ui04tPeASuMFr
         e4KamWJ0n/BW2YaOplt9lflnyJUQe2X4iGkf47m0hEKyPs81iaeMdLR1p/Cl6IIcS5Cm
         X/D3vHWuj8P9unlnA9Pw8dvOKU+Bu31/VzNMHLnaee8JkyoLO8LzQwFnfOXixv4eROoR
         YR6AO1bBt4ZTnt9aPnPmXW7ZEO4dli8F4PGE+Roy1fumavIoc+sCA9NY8m7yA3gcIBDX
         ZEE0wAzsnfsDE56acoETzOPpyCKOBeEnTGRDaryAZAkuLCgspB4dk3oPq57h/g9nZ6bx
         dZCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714323774; x=1714928574;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HVb/istOOFF+rmWyt8gQSKE0pFXyJo+EVF5zHPmzDI4=;
        b=HY2h9pNu175o7BabS3GhiFpCQhCUYZX+VPaWOY4AuhMESN/zDKSvdVfx2pytpKayLn
         VYgeiaEPB8gPAYxEHC5iNtf5Ls2YEDOozrxbrbCCUHGVpviRMVXPlFYiHp+9LBOx88zl
         Z4n+Sa7AXi92cwml0halhRmgfZvfvVC/O5MBGHM0Z2BFKcsoCPbfJOnNLm8v8HUvGv3G
         tE0NNE9YRiYWhJKuAjfw6P+Dw6zkXRSHPj5VVW9NPL38O8FyCR2eSrGT2WxKfqzsedr1
         Y4jqcuATtajbrU5uVuGf/7TQtfS/9rXPjEDE4XF7RwvVEwurzI/FBptuoKWehcabvFbp
         9t0A==
X-Forwarded-Encrypted: i=1; AJvYcCXWA9lSWI0DXZT2zvrcI0GvCTVMujwCEDDe87TedUQOnz26npMoqF17GnAkC/9/JXa7LFVyAoGZL1cuH8GLSU8DKe5u2AjamDz7oYHDNGn7g5cVWJyi+9m5sM3KqOTSHOoLsIreJZl2gMadupRWDp79A2hx+f2Sl567m+9lLbTFITnHCMwY5NhuMlMpQQ7gpJYMVvL1GWHPrNwCdGC4bQ==
X-Gm-Message-State: AOJu0YyMVFFJG92jXhLbM/GD1iN/oct6+7e4ssFC+611s6+PxUGOln42
	W1R4Eg+nzI7P6rw9Z3ectAyL8KoHd211159x39620qZq6v06uzg3
X-Google-Smtp-Source: AGHT+IHBi8swj21g7U3yY2pLX5OEneuGXZ/w+gQovJ4qLJ8IkDpZry1t39nv67TV7WlNysSohwLucw==
X-Received: by 2002:a17:902:f648:b0:1eb:7ba:a4bc with SMTP id m8-20020a170902f64800b001eb07baa4bcmr9623360plg.51.1714323773903;
        Sun, 28 Apr 2024 10:02:53 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id o16-20020a170902d4d000b001eb3f4e96c2sm3172860plg.157.2024.04.28.10.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Apr 2024 10:02:53 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 28 Apr 2024 10:02:52 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Jose Ramon San Buenaventura <jose.sanbuenaventura@analog.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-i2c@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
Subject: Re: [PATCH v3 2/2] hwmon: pmbus: adm1275: add adm1281 support
Message-ID: <9fe9387b-a5ba-4194-ac9f-2457c5bd8e7c@roeck-us.net>
References: <20240425070948.25788-1-jose.sanbuenaventura@analog.com>
 <20240425070948.25788-3-jose.sanbuenaventura@analog.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240425070948.25788-3-jose.sanbuenaventura@analog.com>

On Thu, Apr 25, 2024 at 03:09:48PM +0800, Jose Ramon San Buenaventura wrote:
> Adding support for adm1281 which is similar to adm1275
> 
> Signed-off-by: Jose Ramon San Buenaventura <jose.sanbuenaventura@analog.com>

Applied.

Thanks,
Guenter

