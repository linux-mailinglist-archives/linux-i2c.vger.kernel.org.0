Return-Path: <linux-i2c+bounces-7730-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 415F79B98F4
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Nov 2024 20:50:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 03530282053
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Nov 2024 19:50:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E46081D1E77;
	Fri,  1 Nov 2024 19:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BdM5T9X6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F96156880;
	Fri,  1 Nov 2024 19:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730490602; cv=none; b=jzm41NGRnXskefg8OKfdUcuUdd46pAH4hRSoiXlYpujxM/OIancePQvRxy/6R2Ar3pnwzZQ5lauWXm7KORuaJHllRrHTJyJ03siTXsfsy7wTbqwKMOXqNG6BHLZDDvSxO9xUDSPJX9s1weg2Pl4t49qRSePfXY/yXbBpwp9R0tE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730490602; c=relaxed/simple;
	bh=luS8NW2GB3V/o8GSJZo3RRZbIIzyuIvHenQwhJRwEd8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ef9ccStZjUcrExXDGqkiHU+XRdFYchUR7LklcEumWhzF0dCtfzsedf7nkDRQ1bEvTj7u1J1UVduQ0XWa1dafdlKd/pZTup+Zhji/GK9NQNBpvBSSHQ/Cl2NhoxfUTyvvavKo6cWgnlv1uDAdLol+p528hmCkE8iMs/DnlqcWO74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BdM5T9X6; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-20c805a0753so22723185ad.0;
        Fri, 01 Nov 2024 12:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730490600; x=1731095400; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YLIJYHKbxncL3tBSi6lJQ2mKmJvbbbFiZ7UzcW54hjg=;
        b=BdM5T9X61U8Uu3L6JuXLAmfG8Exfz4EFqU77tXGLKT8jfaMHo/B5RlXk+H6LH+ytXD
         DzfL08R4u6KFZgax70fq70PK3S2aBR/YJXV7Zej+uxuQU94Dbt/xqnanFdZdr6Gj5Zyz
         wOp8nBLGkLJ/nMPpmnMQievFD8RR2HDmwpA8cQnGrog+NGYk2ko3OhV64sh1u+EPByKI
         OXYtv2qCUOuUvXpEWfogeFR8gtyu8oRnTHLxGdibrL394zcI/KCDqZuz57fFyRHFetO0
         TlXKsHiM65CKw/8UZv9qLPya3017hgAjjntTQ/9PJQcxcYM7EF+mE0MSzqGqMzAXQdFQ
         CAjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730490600; x=1731095400;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YLIJYHKbxncL3tBSi6lJQ2mKmJvbbbFiZ7UzcW54hjg=;
        b=nJx5kgZa9P+/PnD12Ke95m9a78ZtsZlWFN2tBgDX/IofTQAcvY7cRWPAQesfiH3SBs
         lZSGh0sLEjIdAjaW7uzMRxNq38iCf1skXmjmWz9wxoOdU61P7Rsq+X4QlZahBMLrMR1c
         2bitk4zI0Z3DNko12f7THM4MTFrF6QxNWoHOn7CbOwM7dBYlLjC7PCcTDXpiRyX2TXLL
         8eamzqxXdH6YajoUwNyx2amJC/7iERolc8EK88nlRJaHR6q4DDtwzHynV+swzzGBKTw8
         VHXwsNZ+5RBecYSTSgGPERF+qtWW1zm0sNy8+olsG4SUFWQa+IcJZoR1Yhugw5zraB0D
         M71Q==
X-Forwarded-Encrypted: i=1; AJvYcCU09pc6y5Yi+ejqF+DSR1Luq/cOiTqptN8KAWZMPmZ8vGzeFIQfZ7eLjF0zsZe/bJIxzrULXg2HAmwL@vger.kernel.org, AJvYcCUf5ODYkyM295imiFF5R7iFOaMPhnftJOZ+3iXCCEpICHDvJRNf8Y1wLxIpABXsXsHejU9P6BWB2cXf@vger.kernel.org, AJvYcCWokfS1FoFS+z3MI03WYf56PEOOL3T+q+8DNVrulxG6PM5vS0mJwryf8dnYUWXPsE6OpIVNTnX0Utm6pb8=@vger.kernel.org, AJvYcCWy7d9fd2D4/amRqrxnkfFoIr9oCKdWBf+YIJYGTmQmvRCNfY03kqYglbge8sjRhnt9rD5wvUfOhr83@vger.kernel.org
X-Gm-Message-State: AOJu0YxzsOVHSVWb9rOS5VCPEBqfdP82u6t0eB4keF9lKe0pMQ3/M4uq
	JauFqG/YqZmSPH5WDGEzEC+usVgHDkBu1yEcFW4hyLYw/LYY4wLe
X-Google-Smtp-Source: AGHT+IEi3Vq+ON1D9GBLt2VNY+hDGp0aujMgDpAiw0P0nsXdynNFwkhdDPy3GV35pIp++Bhh/CvmWA==
X-Received: by 2002:a17:902:e851:b0:20c:94f6:3e03 with SMTP id d9443c01a7336-210c6c6a272mr312228725ad.47.1730490600221;
        Fri, 01 Nov 2024 12:50:00 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211056eda2csm24828235ad.49.2024.11.01.12.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 12:49:59 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 1 Nov 2024 12:49:58 -0700
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
Subject: Re: [PATCH 2/3] hwmon: (pmbus/ltc7841) add support for LTC7841 - docs
Message-ID: <1b337970-ca67-4942-b736-9bfef30ae5ab@roeck-us.net>
References: <20241029013734.293024-1-Mariel.Tinaco@analog.com>
 <20241029013734.293024-3-Mariel.Tinaco@analog.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241029013734.293024-3-Mariel.Tinaco@analog.com>

On Tue, Oct 29, 2024 at 09:37:33AM +0800, Mariel Tinaco wrote:
> Add LTC7841 to compatible devices of LTC2978
> 
> Signed-off-by: Mariel Tinaco <Mariel.Tinaco@analog.com>

Applied.

Thanks,
Guenter

