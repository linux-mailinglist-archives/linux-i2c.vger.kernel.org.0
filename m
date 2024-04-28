Return-Path: <linux-i2c+bounces-3276-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A33B18B4D28
	for <lists+linux-i2c@lfdr.de>; Sun, 28 Apr 2024 19:23:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5A6C8281521
	for <lists+linux-i2c@lfdr.de>; Sun, 28 Apr 2024 17:23:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA2BA7319A;
	Sun, 28 Apr 2024 17:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GE078V1m"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BAC36FE21;
	Sun, 28 Apr 2024 17:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714324989; cv=none; b=ZnQbyizxWZDDV+yKVfsEFlSh+UeEpACwFAiMVMLTKVDbeDdN3nVjWKVlVVZMEZHffC+DFFJdBnhzX7EtXEcKuAGDycrrwufrkxAa9BLIemOSO/Y3Bof4lOC2OPff3VvY45/cE4JEFNSzmXHUGs6UJwaxw7YAhu1//SMM1pBgJQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714324989; c=relaxed/simple;
	bh=PYFz5HTWMutlt0eTPiwR2RA99TqHVcOULCpVwL8wV44=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ie0YbtpPGdQ9knw/8B1lZWIHbidUN0AfQELAa6If9s3II8vJnxfd7W2Xn68VbqiHu08NVq5AwfZdUh3q+LV7Alw8s+DEiQf5k4GNbGG+Iedkb3YwbntmNSnAHT2AwiTnoBObvRjaNyJpxwmGZO2873gCMi0/EsQCNgBBLWwFRpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GE078V1m; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6ed04c91c46so3660177b3a.0;
        Sun, 28 Apr 2024 10:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714324987; x=1714929787; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WkZp8j5EtMWXXwQU8xtuxveb6JUFMfZuYsQT9nlHj4U=;
        b=GE078V1mygz7aY8mhZR4k2GQ6ja1YgU1dxj7xEIwtXeNo7mWo1eGuQu5Y7Fp91DEtA
         gGU7ocFaLNAnLOOor7Q8jpyL3ZOVR5WfZ6ttYGgYqTF+3hyL70hH80ee62EoI5n4PI/Q
         diUEsQPx2gnA/RFQSbsfTMtAPj51nxig1Sk9lSiHDMA99jPC/+pTViQN3znykRycFT4H
         g3gdgDOsBPZT91eN4i1Ar2OXIiMJQOpo7opukrsWm5FBtZNb7ZjIyFhT389UJjZcU0O6
         nEuy9l/Lrw8VB1M8BcIij6+XMx3BRHWXA9ECx0yO1lC0P5GWfTJaQYQYQ1agn5kjdQEL
         oskQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714324987; x=1714929787;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WkZp8j5EtMWXXwQU8xtuxveb6JUFMfZuYsQT9nlHj4U=;
        b=CVtxKQSUSvd2zUg5Ab+ZKPiQbY2C0xGjt3T95xiog71ejv5eYhyCQUD1G52zMST7aK
         gTD8t4I2yLDavFG1Uz6oa1nukbshKRETcMm7THLKtkHLiUaFOlrKH2JqiH1vpHt7B+9Q
         UzT7Hp9c9IDNrii9iherKrRLTJ90QNtBwMgZdGDTbtdanB+PNFT0Mk/bnF+DbuMrWtXO
         YTepaGALHNsHNbaBxNlSj/L71P/3KUc1D/w6LItNcDu0fxzB2uMz8EJMjLY7DalrPJdj
         4tmt3zakb1vxVRZ3bESAIoJZxbhx7s3u2xYgsXhnQHcTP7rT94aLc6PbuezB/v8h1pp/
         k90Q==
X-Forwarded-Encrypted: i=1; AJvYcCXq9qLdKhIzMwaYByC8YT9RhUlSyndgLkKlH8+JO8p0yMYGuXVMHGx/47q31E4dSHFdyZQ4DJO9HLWICZ/PPsO0MZxF7RA/QcGcX/KGbpk9uMU5iS/6OBwRp+jca9OdRhoZxlbUIJsiflsa8jXSZ5YkDPRS2LQYsN0EoxISsJWPLa0YRGKI9gnthtCAnl0djDiYQSOHRQjRcOHN8K2Yu8fnsr16O+XuL/dlRaBcEK9B0QklauEP29kWdxfM
X-Gm-Message-State: AOJu0YzscXDaU1acbx3zwCYtRAKrnkqOKmQ5pud5lf02ZMhSw5tS6Hhy
	LxwRFiXT+evVXD0utqxSdBpf5NCvKV+KWxj4qypJl4H67dpndnup
X-Google-Smtp-Source: AGHT+IFknSQ2W4h+jW2irM7chqU+6+Gh0g7OpxMZOnhRTTvSUweYDfHBuIe/cSEyZorYMbZ9fOhJZA==
X-Received: by 2002:a05:6a21:3a43:b0:1a9:3e7a:b0fc with SMTP id zu3-20020a056a213a4300b001a93e7ab0fcmr10728714pzb.51.1714324987560;
        Sun, 28 Apr 2024 10:23:07 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w13-20020a63d74d000000b0060cc76aab72sm4628983pgi.46.2024.04.28.10.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Apr 2024 10:23:07 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 28 Apr 2024 10:23:05 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Yin <peteryin.openbmc@gmail.com>
Cc: patrick@stwcx.xyz, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>,
	Patrick Rudolph <patrick.rudolph@9elements.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Charles Hsu <ythsu0511@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>, Lukas Wunner <lukas@wunner.de>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 2/2] dt-bindings: hwmon: Add infineon xdp710 driver
 bindings
Message-ID: <e16ae555-3c10-48eb-94e1-e4ee77c2f521@roeck-us.net>
References: <20240425153608.4003782-1-peteryin.openbmc@gmail.com>
 <20240425153608.4003782-3-peteryin.openbmc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240425153608.4003782-3-peteryin.openbmc@gmail.com>

On Thu, Apr 25, 2024 at 11:36:02PM +0800, Peter Yin wrote:
> Add a device tree bindings for xdp710 device
> 
> Acked-by: "Rob Herring (Arm)" <robh@kernel.org>
> Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>

Applied, after fixing the tag.

Guenter

