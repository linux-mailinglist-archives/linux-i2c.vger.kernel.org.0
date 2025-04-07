Return-Path: <linux-i2c+bounces-10191-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E326A7F02F
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Apr 2025 00:11:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 54900175A76
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 22:11:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA4FB223710;
	Mon,  7 Apr 2025 22:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J9WKiBnW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6674320E71D;
	Mon,  7 Apr 2025 22:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744063863; cv=none; b=oSOg/l3S38rrMaEvoOw/prvbBxQsJFeN64gy/CmJIesqDG8W3C9Jl7AyJKjn0qZhafoxwDqbayDTtv8MoJVmt1Qvj28FYFM0ObC0vNukomMPlRJo79NIBvSHbqHkrV+N7soEvsS8PKwmqF9dT9gxQ01HmoabpzSAeUM8p7xSG58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744063863; c=relaxed/simple;
	bh=oXs+S6jVlOGx9OdjJzPpPkt2TkZmWnt20bsYY0sfycI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hphv1Hv18scccPaexjWzN+kIleuzRi+U1w5ifTW2qOQQkTfrIEbPVFuXSbwDQtg1iN40i6eG6sOcPHlQsRcvg/+k4LbbcCzbYETyJimuHaHMc+e3XPMRzAKscBUQW88ypPpgmerWl7rOC5T7sRjEm904ReniFOua7aUdFpddUQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J9WKiBnW; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-736aaeed234so3940280b3a.0;
        Mon, 07 Apr 2025 15:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744063860; x=1744668660; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YifP3IHlYasWdbiAjH/wU2s8OBHQLZQM5vo24wvS4uQ=;
        b=J9WKiBnWsKE05+t9RhbzpDjje8FzldQLtHKu0HxkNcte4OCWorebnmta47JYRBw3LZ
         CEhUL5TqMSrRiX9DCxQfykmAmlQZp0CPwFbDoQc2bOuwDi3sxWl22tzMntB+h9mmkO4w
         7LcgCYJCli9d9pYEiMDYwWsRrMgj3BOgQxNvmLIoT9t02Rj3xS1xyZz4kR9oKiQ7Z2CD
         EL7z1/Y7gW/utOj9QIzU4LxFmiuSK7cmRS59vWjwIr2yS+LG5rh3MQ27GG07li6bKRuE
         a+LlSq1+r44/McfOpCzsTbdRzL4sB2PIxy3GnhPAVSwFcUGWFE6cnYB0ZVD/5BdU7b8Z
         RI9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744063860; x=1744668660;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YifP3IHlYasWdbiAjH/wU2s8OBHQLZQM5vo24wvS4uQ=;
        b=nfgSvlnwrbk0gUrxhsCg4xg+XT++xGc+TihVy9NsHRzVb55Jwnk6V0sZHyAiZJroU8
         5rl/lp2fvrzoeAjDnqOvJBOfg9Y2CkJHvluTjvnYfV4EppyuEuJmpGUOX9xvZq1OI5a1
         JZ0YroS7QpoceOGdVZbjGtRPhB3dzqhcYcgJIPoWU3n0JvpFArl4FMkY+D53srJ2o/6J
         TXw76agP9RvBK5SaUkA+C/E8eiY0/Wmdx9iHumj6F55ER3KASBnc8BQ4+3PP1duLpWLq
         SoU1AbPzeeoARUEdnUw5vO7ACl492a15YcpVyAOAfekBPqKRSdnzTtW9tV6QK/nQmC17
         qk+A==
X-Forwarded-Encrypted: i=1; AJvYcCU5Z4IG1e2AydTMJHEEAkcsv6+5PXRG2RdnB1Zbu1450kFACOOUGfOVEGIWg3BUdQi7/o20wuETvtLhlLWn@vger.kernel.org, AJvYcCUzdV4AuW9mzjb1R+ELNUuiSvdoBaq5hEcfa9M0ZhJzO3FGXcP5Od+ozkeFoHES/u989qVe/A/4T6Uw1dg=@vger.kernel.org, AJvYcCV3OooXa8AC1WpofFsUyOBgz9wyXHSR0yzZg5m3kivhHcMazSC7Zo+padZqfhpw3aLg5GwU/j0cIT8=@vger.kernel.org, AJvYcCVNZPkprQvJbVblSNImXvpOY3MfNt9U8YVD08HxahyR/vPU0NMpV3EFSYfXs6vyZLFuYCWIz17UkVTg@vger.kernel.org
X-Gm-Message-State: AOJu0YzxWKCYgsX5s5G/GMR2WppJaPrf10vacaCcTk4tOschU/GWcC9G
	xbEoS53mP1FA9GfWwmWOHBMSnZOvvyCBa7wnhhLEABbim5+1NXkd
X-Gm-Gg: ASbGncuC6lD7VCxeo3GbRGCLo7sVuWWpzQ7h7HCyItWq+65J2mfs6Z/p5Ks25R4vowj
	DbQn081K8y54Tk7IBYjnmICKcnXoZoTgtKmFkIbxIxBykHjjJsBWYCMKGeNflNy7Gh5+hyTxxZy
	9C8LwD0lNBTkQz26qXfYq0QCgNE1FpheDJWfw8aRXlXs/Iu3y7zCgi18qNuQRb6wpJU7LFjMNXv
	MCZFfdQ9jgF9XDc9qSowsnrN/bpI8LPw0y4i1Ln2N7qudFmYwlbe9NqolNahaiG+XAMWIbnrgKz
	EUO5xAVst/bshG9hACjmwBbPssg9fyJj/MURI49aRY0IEYns/NH6ZG3cfGth4vozPPty
X-Google-Smtp-Source: AGHT+IES2QXxO8lb/vTvHlhPSVDGrsTaz8KmqVRVT0eakMhdejsKNxaarh9P/bZGpi9gt8LD22NXDw==
X-Received: by 2002:a05:6a00:1acc:b0:736:fff2:9ac with SMTP id d2e1a72fcca58-739e7167605mr19224558b3a.23.1744063860529;
        Mon, 07 Apr 2025 15:11:00 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d9ea154dsm9053606b3a.112.2025.04.07.15.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 15:11:00 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 7 Apr 2025 15:10:59 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Cc: Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v3 2/2] hwmon: (pmbus/max34440): add support adpm12160
Message-ID: <3f4279e9-8667-4bd5-8815-32f05d080336@roeck-us.net>
References: <20250407-dev_adpm12160-v3-0-9cd3095445c8@analog.com>
 <20250407-dev_adpm12160-v3-2-9cd3095445c8@analog.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407-dev_adpm12160-v3-2-9cd3095445c8@analog.com>

On Mon, Apr 07, 2025 at 11:47:25AM +0800, Alexis Czezar Torreno wrote:
> ASPM12160 is a quarter brick DC/DC Power Module. It is a high power
> non-isolated converter capable of delivering a fully regulated 12V,
> with continuous power level of 1600W with peak power at 2400W for
> a limited time. Uses PMBus Configuration.
> 
> Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>

Applied.

Thanks,
Guenter

