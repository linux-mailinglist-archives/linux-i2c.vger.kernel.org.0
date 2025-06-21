Return-Path: <linux-i2c+bounces-11544-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F96DAE2835
	for <lists+linux-i2c@lfdr.de>; Sat, 21 Jun 2025 11:18:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8FFD85A0368
	for <lists+linux-i2c@lfdr.de>; Sat, 21 Jun 2025 09:17:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B7391BD9CE;
	Sat, 21 Jun 2025 09:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i2JVU+xG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3020819DF5F;
	Sat, 21 Jun 2025 09:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750497483; cv=none; b=TrHhPu35zfmMapWUVEKlfCK1hKA/N0hKZGcOMh1VNiMQZFJiVaTPYxCgpngtiAuIvm9gB/cB7GKghCC9jCaX0ZfXUemPGnQgQTLBUQvNdfKU7W9ZLr8hx9MCPULtEW0iL54zUy3W6J0A6aGzb1aYvRMX9haXhh5yS/IAiOdh8nI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750497483; c=relaxed/simple;
	bh=EhzpSG2q4ulWK8V4w7ha3tX5hZkgBYT9pkn064QL+as=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pbTFkvDPqjaswJhoskp2MCK8F59qt8OVFcLRegJ0D9GIV7KSRKPPpJYeusnOmdIEeIciwjzcdLP65hU2ud9/Jl+tbx0Cm34aDV0+cV+gW1QJQ3ljP1w8wlClwMLPpqJf2FXI2DrcfH3DE8a3o9xSNDvQV8gz84KjPxooKXo74YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i2JVU+xG; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a589d99963so2557819f8f.1;
        Sat, 21 Jun 2025 02:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750497480; x=1751102280; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cykO9Lm2+Sgl3FhCgYyy7e6399uOBDhxWMkFGXDxZk0=;
        b=i2JVU+xGQFT83LosnATmiM0IfZaNowu6nwgIZGl9lCaNW90pmbsJApBTc5Tp1eO9jV
         Oyx2RBb42xZq8/UbpZCGM2y2DCeEbsSb2ZM8YW0dNly6WJ9XYngGMpAFP+PBDOUCjGZO
         hCY8fgIAU/Uzaw9H4ZcojIOuI7gqi2hjmpHtiUsDNpMTVD1XpsHR3pZmP1NzHB+ORUwr
         URqttcSBdRai9o8W3X+TkesV2t7Ox7FP2ofqugrWxn0nfzlKTu7zwoGPDhAepyiPLc50
         cdctPZO8wWtw6vI9oeFpgrGJZPh0VQm/OaH4+2FBEPXAaZUglV51b+TLIvS0ukIVWroE
         y1aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750497480; x=1751102280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cykO9Lm2+Sgl3FhCgYyy7e6399uOBDhxWMkFGXDxZk0=;
        b=SFCSPjmXi0gEyfAR1EIIyqlDb0fhr9dYeekUysqts2Qajk70RCqSTi4d2LXFFJ+3tY
         vX3qHpLTMmFWWmgZZbK553s8qth4xd9uonJkhkugRbHfK3U3Omcsjecrxwbn4KK9hC29
         oblluLckd5XKWerI9erd7/6HbTRYFxTDlVLPxWwb6me4B3CP75Edk2Oje+caheY1FHUn
         Nhzq8WNFQq/yFZpk6EOOnAmi8vpPPeD8lDouR85uiH7sIoML1horaQL/mElGsmbDh83I
         DVU6uwqdPJgOPcH4nLUUxaVJiwcz8RxQq/x8Jf5xtvqE8x4WHwbgJP391447E7r3LWIb
         QbWw==
X-Forwarded-Encrypted: i=1; AJvYcCWpigiRxk1qHYqjBvSH4WAr9gCFE1X6igoghUkldCBO7ADdJSJN4fas6yVckoduQp6BaK2th9P6eHAfP48=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQCRkUJ6BSmTaQQ23/CHKmzbstOuT9SQgN3n5w50cKBpp5ZYPA
	4M8TVmF1C5dafPRvqVR2aF/ayfnfpYTfuKq8HMBlrCIe8cK09hPnKnV8
X-Gm-Gg: ASbGncvtuaW4dXNOS7v/J/UhjA7XfzudCYKnS8NgAGLQD+vOxDIdjizht+/XNgdj+Lf
	2/l8sgy62kYBD+eyO7GL2gcstArSuryL7tQ5KZojs2jUeasW3Y1bFkaRJZdrW7RFxakIDcVrLb+
	Xgd9llQP4r5NN/qq8HrGbDBSOv2nbeOWosc+nhfzG34YZ4l/O1+1ymz/cQjHOvoWnpYEDDOMd5U
	4yWlxOn/lurnKE0eJhSWMqLYr5/sXS+ssIogePuCzL5vO/mS8/ogmOBNjtJFq5p85PqxLHvdxha
	tCb7NmafUUexVzTHJn2RdU5f40iK9//xgBmYZhiLI0zPXvWFMIWhcS4CfDjgWIhLHgeMDkxYLmt
	2nFMXcSpJRHE2CvdpQP09wyqLxFJ8
X-Google-Smtp-Source: AGHT+IGrdVRC3pYl7esqg2s6QTT3+E8UbVgpPnMOoerqr5OvHCe/Gs5+1/forDbOOq2qIB0ONsY7xg==
X-Received: by 2002:a05:6000:98f:b0:3a5:24a9:a5d3 with SMTP id ffacd0b85a97d-3a6d12a41ebmr4718245f8f.17.1750497480212;
        Sat, 21 Jun 2025 02:18:00 -0700 (PDT)
Received: from masalkhi.. (pd907d170.dip0.t-ipconnect.de. [217.7.209.112])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453646dc66fsm47281235e9.18.2025.06.21.02.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 02:17:59 -0700 (PDT)
From: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
To: abd.masalkhi@gmail.com
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	wsa+renesas@sang-engineering.com
Subject: Re: [PATCH] i2c: core: Serialize 10-bit client instantiation with mutex
Date: Sat, 21 Jun 2025 09:17:57 +0000
Message-ID: <20250621091757.16926-1-abd.masalkhi@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250614083734.3385182-1-abd.masalkhi@gmail.com>
References: <20250614083734.3385182-1-abd.masalkhi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

Gentle ping.

Best regards,
Abd-Alrhman Masalkhi

On 2025/6/14 08:37, Abd-Alrhman Masalkhi wrote:
> Add a mutex to protect against race conditions when instantiating
> 10-bit address I2C clients. It serves the same purpose as the 7-bit
> address bitmap (addrs_in_instantiation), but uses a mutex instead,
> since 10-bit clients are rare and a full bitmap would unnecessarily
> increase the size of struct i2c_adapter.
> 
> Signed-off-by: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
> ---
>  drivers/i2c/i2c-core-base.c | 8 +++++++-
>  include/linux/i2c.h         | 3 +++
>  2 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index 2ad2b1838f0f..f5f53d378fff 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -929,6 +929,9 @@ int i2c_dev_irq_from_resources(const struct resource *resources,
>  static int i2c_lock_addr(struct i2c_adapter *adap, unsigned short addr,
>  			 unsigned short flags)
>  {
> +	if (flags & I2C_CLIENT_TEN)
> +		mutex_lock(&adap->addrs_10bit_lock);
> +
>  	if (!(flags & I2C_CLIENT_TEN) &&
>  	    test_and_set_bit(addr, adap->addrs_in_instantiation))
>  		return -EBUSY;
> @@ -939,7 +942,9 @@ static int i2c_lock_addr(struct i2c_adapter *adap, unsigned short addr,
>  static void i2c_unlock_addr(struct i2c_adapter *adap, unsigned short addr,
>  			    unsigned short flags)
>  {
> -	if (!(flags & I2C_CLIENT_TEN))
> +	if (flags & I2C_CLIENT_TEN)
> +		mutex_unlock(&adap->addrs_10bit_lock);
> +	else
>  		clear_bit(addr, adap->addrs_in_instantiation);
>  }
>  
> @@ -1538,6 +1543,7 @@ static int i2c_register_adapter(struct i2c_adapter *adap)
>  	adap->locked_flags = 0;
>  	rt_mutex_init(&adap->bus_lock);
>  	rt_mutex_init(&adap->mux_lock);
> +	mutex_init(&adap->addrs_10bit_lock);
>  	mutex_init(&adap->userspace_clients_lock);
>  	INIT_LIST_HEAD(&adap->userspace_clients);
>  
> diff --git a/include/linux/i2c.h b/include/linux/i2c.h
> index 20fd41b51d5c..1d4d0577b5b1 100644
> --- a/include/linux/i2c.h
> +++ b/include/linux/i2c.h
> @@ -765,6 +765,9 @@ struct i2c_adapter {
>  
>  	/* 7bit address space */
>  	DECLARE_BITMAP(addrs_in_instantiation, 1 << 7);
> +
> +	/* Lock for 10bit address instantiation */
> +	struct mutex addrs_10bit_lock;
>  };
>  #define to_i2c_adapter(d) container_of(d, struct i2c_adapter, dev)
>  
> -- 
> 2.43.0


