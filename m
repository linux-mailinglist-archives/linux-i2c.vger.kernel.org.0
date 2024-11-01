Return-Path: <linux-i2c+bounces-7729-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E208F9B98EE
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Nov 2024 20:49:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E197E1C21578
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Nov 2024 19:49:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C06AB1D1E6C;
	Fri,  1 Nov 2024 19:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TpWJ6J57"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD63A156880;
	Fri,  1 Nov 2024 19:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730490569; cv=none; b=n84WB60/x1BGYWKtx7jNlWvDV4RXtGMDmX88UMKAjE4ckFIP4fnnhSqK9a3iVOhVV7ozu1hKuQYhi2eXLuMxoXvShpc+wRgXw62O4dFndYkMSHPFt5d5uX+p+Z//N6OUrZ5MjvkP4FNYNmG7zUAwdoC7GdCYFxhZVCvAy7sE+vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730490569; c=relaxed/simple;
	bh=tkq2yYeLu6LnSyYV+gA5aF/MyDeiUIcMbb3egS5FG9U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=erQQiJWPCGc/hr9Dj6eNRSOzheV7M3qOVA1MFHX54+ZHn+K+tN7Nke18PI9HO4pVgqKM88uRq60ScTB+nXUoTLN3x41WkIHTv66e3NA1G8C2XxJXI6Mr5CC3n5XuZ6LFteN6Ub6osNpnQvnTwcXsOw7w3164lQCUCfwnDCFAI5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TpWJ6J57; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-20c8b557f91so24302355ad.2;
        Fri, 01 Nov 2024 12:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730490566; x=1731095366; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=164gMOjRUTPSKKfsiVjFOz9lcqkaWJE/8xv4JL7sr6Y=;
        b=TpWJ6J57hlGEBT4GTTDpwGcSOsyPXgmUQbGd11XIPISEPGyiNZy1EPj+u6kmqMdgPY
         LhoCL1sODcjaEh1hK9Wyj/bCRY2VJHxj1RAeFkRTPKESiVzPmorsugbeAkTbYp0X3HgM
         j0GbQnMfQzn1IoyIj3Pd+AuJ8aY5qjC1fJ5kQHlPUov3UJURiGNf2gZOgEB3MzzsjPDZ
         HcfI3AcE3U7okAInb0Yy1p4DOMGY8/NhwdynePb1iFUKYpxC1xkT3m72eB4syEkokx/t
         /84SiSalcoJ39K4Qo6soI621hoSvMa8iLdYmFytFh1RWUb1NJpW4jf6wKPB8ezBBjQu2
         enyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730490566; x=1731095366;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=164gMOjRUTPSKKfsiVjFOz9lcqkaWJE/8xv4JL7sr6Y=;
        b=JLLBXOuUIn+bfNCRZKx0mffsFEoEoz/a/26YSG2wP2Z2WNiqJrwt+dOQJQDz4nw+jw
         OiK91wklM6YYt0cDJDDB/aBnOi3eQJ5Bw7Jyq5RkE/YqR9JkbUlQ6AG71Q7jSrg7Sjym
         UWZ/5vVeh5Uu2OHM3xX9Xpx81bz8vHR5Q1X6I2bGFQkWTeb2Tnk1U984fxR0N001NmXG
         v7u9CEtyDUX7ppOCLIw7kvZUlLV8lxXPf/n7kwvruPw+AmHp2OcF4zTEtbvxojrvk2IT
         lbiFxNEH7SjpI8QP2OXdi+fSg5wMIkXTK0nROLeoLWfpD98QadnCTC5cqihTY0zAkrV3
         gcSw==
X-Forwarded-Encrypted: i=1; AJvYcCVb8u5X9paa/IHzby4q3DcB8+xeZumSr+C/LxSv0jTkvVXTIVVxfetirNtcnugmGYIXzqxvmqfmTHr7@vger.kernel.org, AJvYcCVve46Vs9C3Uama8vRIepFejs1jFcuIVs5oJY6s3JGugj/p5W7j450aU3zpIjl2Mm2h47jcl3SHzCEy@vger.kernel.org, AJvYcCWCzcGlMgSjdCXuwyfhZ8c+JQmSq1ibB+lJiaCn1a5jLciH/MjMPi41Q7+jWpDJPMF7WnGQQfx+sTFjc4Y=@vger.kernel.org, AJvYcCXbWycjjkld0NRbE96Tb3+i+mZgwPCSq7aSb5G9lIs6f04fh8xrol/cGa7QJaAada1oSLjOrtOT3jMZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyD2e7XMegdUv0zliA/8uKVP7eBYGqws42ZxJvIup4yOZAqukMM
	rMWxNhqdwlNgQNtmEsZy2TIf4kRAJt4cqBWy+pGILUvBGvCsChYABxuLiw==
X-Google-Smtp-Source: AGHT+IF/92Ovar0TgPaZne5RAU4+tBDcpdXTpRFJmd7mTKaSTBqbdQoNxCfHgF02Ql6NPFGj9UO5lQ==
X-Received: by 2002:a17:902:ce90:b0:20c:9821:699d with SMTP id d9443c01a7336-210c6c9354dmr355288555ad.51.1730490565804;
        Fri, 01 Nov 2024 12:49:25 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211056ee3e4sm24955345ad.3.2024.11.01.12.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 12:49:24 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 1 Nov 2024 12:49:23 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Mariel Tinaco <Mariel.Tinaco@analog.com>
Cc: linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-i2c@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
	Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>,
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org, Frank Li <Frank.Li@nxp.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: hwmon: ltc2978: add support for ltc7841
Message-ID: <f8892769-2a17-41e4-91d3-721b9dfde934@roeck-us.net>
References: <20241029013734.293024-1-Mariel.Tinaco@analog.com>
 <20241029013734.293024-2-Mariel.Tinaco@analog.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241029013734.293024-2-Mariel.Tinaco@analog.com>

On Tue, Oct 29, 2024 at 09:37:32AM +0800, Mariel Tinaco wrote:
> Add LTC7841 to supported devices of LTC2978. It has similar set of
> registers to LTC7880, differing only in number of output channels and
> some unimplemented PMBUS status and functionalities.
> 
> Signed-off-by: Mariel Tinaco <Mariel.Tinaco@analog.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Applied.

Thanks,
Guenter

