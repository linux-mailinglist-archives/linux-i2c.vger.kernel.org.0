Return-Path: <linux-i2c+bounces-5091-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EDFA69432F0
	for <lists+linux-i2c@lfdr.de>; Wed, 31 Jul 2024 17:18:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9B54B280FC9
	for <lists+linux-i2c@lfdr.de>; Wed, 31 Jul 2024 15:18:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 983031BD50E;
	Wed, 31 Jul 2024 15:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SCb4ZgQ2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0671179BF;
	Wed, 31 Jul 2024 15:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722438701; cv=none; b=qQsUWgYloadGVj7gLWTFBU6Fpu/cACO9wL0ZDrJknnWg6t2ly9IRBkj38YUsb4paEL02lmUfnJLLiDBRt1OVCeMOZ7CU913lqUXByveYAGglpHirD4qPIhDyRQQwXGcBIDpTZAm6TKRXLo2n5JMGaT/paYOe0eLdJ4KmABOnQuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722438701; c=relaxed/simple;
	bh=oLOf7cdQGKq3VuH8kjIub4lYacsfkEpP84g2MaS5vl4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c639a8GUHrJ6GAb0N7+XzIdoBM4v6jiVdV7pqK+qjDrBXeSdprcqF5939NM50dc/v0XfXVVttV879n53gdPBMx1plWHo2rCC8E35YAD20H9GJZNqE/Vo042FYTDEveGIf4rbvzhWlhmOuFIKEMvhWaWKxKPA7NrMsGf+9pudNZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SCb4ZgQ2; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1fc569440e1so52671285ad.3;
        Wed, 31 Jul 2024 08:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722438699; x=1723043499; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7yNtrB/3n0Mce44ws4XKXQ7nTWEMlz6LuFf1Lk+mlnw=;
        b=SCb4ZgQ2AfxTKDbvC1KlpIaH6jMK/FLq3HA/MnaQStaIKF9YxaV+peCliWbIabGgm5
         z2GOZQ4wkqaY3HRokp6OXZVyT3qLEornZGoHILbI5YW3TERf85T0PNodTSNGNwUKB0De
         yA5unD2vQvZ2xDDvzGnW7x0At/ZsBDLiVvZwoj40ndPaQ8E7OTkOqq/Y0DpqUmYgB2M0
         l17yWwU2iLHLW9vurJsRJYERLjpwNRFjU+KUOtWOliQ9I3+caOGQppUO/rYbB6EPvFJ6
         6sSusLlzTp9852maFMhzxP/XIw6XCBBxnF31xI57Ck7y3wJg4RtKE4voWzcdhz02wmMn
         HFAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722438699; x=1723043499;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7yNtrB/3n0Mce44ws4XKXQ7nTWEMlz6LuFf1Lk+mlnw=;
        b=itJjXTik6HMwAUV/lqL4WptL7OEqfx/dgrULGZqyNkFXtixJJkDG7gspcMI/vtbzt3
         QaggP1IUnPqxqL7QpJDJp4B8AhzD5Hj79EGs3GSxqtqmUeNmHUoMMcvuZRWRXcLpaRsN
         Rm5z8oWmGv8zA4TqFQjc5faPYysEEBSZkTxmUN1ZaEBACy8dbNz2IAAm1MGhEBql1zsg
         jqAl/54XdkHASr2dqivzPujAyCu9iEC5Lpv/uz3BSHyyIZb4XFHqZdSJDdkn9uGUJsH4
         U/2G/2ogXBuaCUII+IOk2DM/dPDoXaT6VwREmlZED7e9arb6U7xTx1PLjqGoch2TwFnE
         2tYg==
X-Forwarded-Encrypted: i=1; AJvYcCXsk9mCpiYR86vUtV1lAIwM4JL4nP9BcjUv2z38PlYw8aqp9c+ra6I6yMXwx8a2ZtcKcVBaLF0UOl06fD4YDvpPYIWmo9HewYjKW8BVVocQAHOT1MBR4PLjY9rS7MikJ7PWK87hpDNETsahyStSll82Ty3OmvGEE3Kh7qrCKuc+Wp32RVDRqdniEH2Tmjn/KYFxrLifb7Jym/pp5kKtqrCc
X-Gm-Message-State: AOJu0YyVeTxCGBUl/E6Lv++b+8VR7L6r8I3eq16EPhrEKqIJWIJhCNZK
	rPetLVsYbNMsHaYSFD+a8vZKStKEsJaDT2bmR/IrhbjS9TbKvpWD
X-Google-Smtp-Source: AGHT+IH4GqU/0d7gsdYBiKVRmU9aLMUbGwBxVgsk25KKaZVkVKwGOi317RCigXKiuGA4ay6vI8dNFw==
X-Received: by 2002:a17:902:d48a:b0:1fb:7b96:8479 with SMTP id d9443c01a7336-1ff048e7348mr186196475ad.58.1722438699024;
        Wed, 31 Jul 2024 08:11:39 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7ca8fd5sm121302265ad.64.2024.07.31.08.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 08:11:38 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 31 Jul 2024 08:11:37 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Farouk Bouabid <farouk.bouabid@cherry.de>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Peter Rosin <peda@axentia.se>, Jean Delvare <jdelvare@suse.com>,
	Heiko Stuebner <heiko@sntech.de>, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v6 3/8] dt-bindings: hwmon: add support for ti,amc6821
Message-ID: <c97485f0-f59a-48ce-8462-be83fd217515@roeck-us.net>
References: <20240725-dev-mule-i2c-mux-v6-0-f9f6d7b60fb2@cherry.de>
 <20240725-dev-mule-i2c-mux-v6-3-f9f6d7b60fb2@cherry.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240725-dev-mule-i2c-mux-v6-3-f9f6d7b60fb2@cherry.de>

On Thu, Jul 25, 2024 at 03:27:49PM +0200, Farouk Bouabid wrote:
> Add dt-bindings for amc6821 intelligent temperature monitor and
> pulse-width modulation (PWM) fan controller.
> 
> Signed-off-by: Farouk Bouabid <farouk.bouabid@cherry.de>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Applied.

Thanks,
Guenter

