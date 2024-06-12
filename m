Return-Path: <linux-i2c+bounces-3997-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E8F905CD3
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Jun 2024 22:29:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D9332289382
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Jun 2024 20:29:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AEF984A56;
	Wed, 12 Jun 2024 20:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ndaM6OGb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B94D5464A;
	Wed, 12 Jun 2024 20:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718224186; cv=none; b=uvKlkgYb/1PC+hTdBaTJtbQpNh9nlO9Tfbn8snXi2g94bhKmU7uo+QJAUmbpA4x6epwKXv3CEuaQ/RT2cmZO/B6Jv7pJmPO1ytkSdzRMat1CESBdNAEUMcEjbRt+GYY5F8GlTZGmjH1jBAy569m+drWkhohYy3a1JZQRxVOM5Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718224186; c=relaxed/simple;
	bh=nZJUMBUheKF0XOl916w6d2YHbRoc99XnuIc4mLqyvfQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=CzyVpruxgipoquDT97qG4QMOmmxiXk6yxPTksSdg8uPRs6mrDVn8j0EG0T+omWv0fQkh5JmLMciQJnl75nU7ONkp/dVE9qnjqXUrA++AKfwj3Mh0wHyo/yE9rGsZIOFYELswpba23zrpH4/OQGuWTcYjkQgiAElylOhDmA6VrrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ndaM6OGb; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1f717b3f2d8so10339765ad.1;
        Wed, 12 Jun 2024 13:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718224184; x=1718828984; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=UgeVeYOXHXcgp0WcORL2Jki2ywZbKPO7faQ9DlnaobA=;
        b=ndaM6OGbF3wAHPKPROTgSbLz5SEELBMpa+/1O8jVEb1pEF2+98ZNXxoXnXpLo9KhJM
         o1ppHBYd2pjV4qlVf/hQ//qxoXFtbsquVt1kJWVJXRnvkg0tPoZX0TJkhmcIkOoOVFKh
         P0CgPJF2GXtx8sJGyNqm1qAUY5+frL/uxA3uxTjLWkLRLqVD0v73H56kf+9gF2+lKc0/
         KwZqA9KHD90ZtNZPudFGLWYLzjWNJcJ9UA+/aY71zsS9Sus1lMq9VLH8qMl7OnInVKki
         Bz8njK0NYzDfpGbuCbsJSUxacYPJtjM1tgFdUKO+vJhMMIah2nOzmYm2QVCZCHR1/nyg
         VOpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718224184; x=1718828984;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UgeVeYOXHXcgp0WcORL2Jki2ywZbKPO7faQ9DlnaobA=;
        b=Lq9HNNpLV/YOtVjaXD89IlSUgmVg+ig06ET0luPT92xD/bGmrgK1ffwyGkePK80vwL
         p1RrdLzJPzHWeHSMfWbvFHRBRelEw4mmOD5fgDGyrXgIgUWC78AMbNlb9S/c4E0zTr9K
         WlTlXAv8AUPuIZ+Jo4wZ6ZWD51GNbRWlMro+1zA7NDWbZ52PX/3Z4OpB3vyPMUcGQlWR
         k+CuFx8erWmjxrAIbwk1MxPZfPFm+Awip2TEEUnSxE0FN5kk2my0CToAfO7Tk8T0rHSG
         G6oOqfVph4rWdlXzJu15sxYcY2ANeMP5hVCCOwd6bJJipfMTCeix7oZqm5lO3stScEol
         ZDGA==
X-Forwarded-Encrypted: i=1; AJvYcCXEdgESIlD4k/pyNibpDeWwqNOP/Klq628T+TBIu100iTvkDXDe1uLn7bJkuWPUnxuStDa7K4Lr6wfZgHlmT/Xbmc3ObdQ89tQb7+G3y4xCurirCi1SSsA1M3gTAT1wYn+L+MjdxVV5
X-Gm-Message-State: AOJu0Ywi4bnCjnuc1Aqq8dPzAHCQFuR6WpeG+19V8o+SPPN6psT8HQB7
	5KmRSnZuYhINh+HXux3XYHCIYQ9IVZeeRS8I7HG+utcpHarUr5CXXNqgYg==
X-Google-Smtp-Source: AGHT+IFyOmXN6ACnRvjCoW3iJbwvVT2NJHu0gBiQPYGOynbuJ3aHut0/FLbFnkOT4TrnAb5sJ/NkCA==
X-Received: by 2002:a17:902:c404:b0:1f7:105:97d1 with SMTP id d9443c01a7336-1f84df9b500mr11316145ad.6.1718224183603;
        Wed, 12 Jun 2024 13:29:43 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f7092a525esm71335195ad.241.2024.06.12.13.29.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jun 2024 13:29:42 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <590a37ae-98d5-4fac-838d-6d7eb224c5ea@roeck-us.net>
Date: Wed, 12 Jun 2024 13:29:40 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] i2c: smbus: Handle stuck alerts
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Wolfram Sang <wsa@kernel.org>, Jean Delvare <khali@linux-fr.org>,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220110172857.2980523-1-linux@roeck-us.net>
 <18c810b6-2961-44e6-b890-5c6830fde995@roeck-us.net>
 <54uga6gyib76qxy3dhgsrwf4x2tbg7644m7cquc7zyw5fzphvb@y5eb54wfvau6>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <54uga6gyib76qxy3dhgsrwf4x2tbg7644m7cquc7zyw5fzphvb@y5eb54wfvau6>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/12/24 13:21, Wolfram Sang wrote:
> 
>> Looking through the patches I carry locally, I just noticed that
>> I never got a reply to this series. Is there a problem with it,
>> or did it just get lost ?
> 
> The only problem was that I didn't have the bandwidth. But luckily, I
> need to work on SMBALERT myself now, so I will handle all related
> commits around that.
> 

Ah, just the "normal" problem. Let me know if I can help.
I still have the hardware that I used to test that code.

Guenter


