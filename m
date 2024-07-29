Return-Path: <linux-i2c+bounces-5074-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C4393EA49
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Jul 2024 02:31:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F2D21C21404
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Jul 2024 00:31:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B403C1C3D;
	Mon, 29 Jul 2024 00:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fFIGtnSN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E5F801;
	Mon, 29 Jul 2024 00:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722213074; cv=none; b=u28XOlK1nteSC725nhm81OEePiSIcIb1ZRHXP91tzohh7Hk9xKlnYwqe+z4qgOKWRuy+YJlRbSIZImAuGWIBfrffZE02t5TaxFp0O+/WjNzvR2VIyAseQPqDDbVjjfhhURyvZmF0VNcj+ZSXtL7R+Vkr2jkf1S5brY+5/O9Q8AY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722213074; c=relaxed/simple;
	bh=Xc4hKw3D1lAjfW6UbY4tqXzP6Rz5Sl374JIAo7L476A=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=FNL5n6RmgqN5Lvw2UVqUJc0Q3sTn6YEeOpQ2iJRZ06Q5fahudU4fx/E458agbkNy2qq+lIVg/Y7E0gOj26ZTWuBxSICnvgXGzbCbiHJUw40x5fdfNomgkWbX/gcgzHPVNPdWJ/h/1A3jIIYzwmWTRYH7ooy0de44OCywT0NSs4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fFIGtnSN; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1fc491f9b55so16394995ad.3;
        Sun, 28 Jul 2024 17:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722213072; x=1722817872; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=//rZSeQzRqiNvQXtTT/CtjiYP4SkwNBAGmcV9pM3b3A=;
        b=fFIGtnSNx5GZ0UV9FYRGbLuFjENrUNdYBGhhGXbZHr0SBzhoquOOQqt/5TnYtJV8vU
         KBqmVnPa0LpdEejjXahx3WUq+NonxTD+RlcNi/sgszWSJlRvPL2fEAtZgb/3YnbDaztf
         pne7+o3YMfehUpLjLwy3HFtSJKPjFaWxuE/D/JU8GnSdr5aeWaKbLiSxwQeUYqz9afkn
         IcXtDLjk9Ou35Vc+naRYmk3bp0bg+tHsxwU17ZovtxZL+sqCx1j+adxVS4Hgye3WUXdW
         8vd1RxvyjW36qpoMEDepHE0ZX+w0TbxOg1fsE38Iay4O1xtLjOCpem1+rd/ykrbAT+AR
         PZLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722213072; x=1722817872;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=//rZSeQzRqiNvQXtTT/CtjiYP4SkwNBAGmcV9pM3b3A=;
        b=FtkfxWNoMdUc/bSIclYNkLgcPABzhCIAsIIbod5BBxFQ17pKZFyiBRctWov2UGO/JV
         aGfaRcYVxbB2DEsvsfQyvS25XROPhnt/C7Y+1V6ECRWwtQCUFInHlTT8n+Ur8hg7LC66
         eYrQq/cm2N5cKlkyxdGxQ8JSSFJ9totgIPCka4oum8EWAs3p9BLWv/ehR22naAfMxww0
         eV/n6xK+O2hCpqSagqIey+ubUVfm+6C68EKpXvICLU5A+fXHzJ6Kr+UOPYYtQtxGVF3i
         f0LDBEGFO2RFGvgwIegT1JDeOdCcO93mjPE39F+gHx41o7/SnOSRSnJE9MJJ/VJ947EU
         dogg==
X-Forwarded-Encrypted: i=1; AJvYcCV2kq5U0GyFkR4KOlWLaiPmispKc/DD/wf/cw/u94QCF4kjl7p3PYA4jpYD5xHcI+u5r8VnGiHEZSueqzz6D7MqUgjX2mE8ZPm0yxiNLpWRJxstKr0JmLgJDHWNqAIwqGVrlvo/fCWc
X-Gm-Message-State: AOJu0YxQg+qbR828YPbL7QqgYKa+oxaD4DDMoixb68Nd35GE4q8c9ytc
	sVxzkGYGo23TfNxyo4uyGh/PfQ9wbdIdgzxwZbpepGcetBpShY/YpBtVOA==
X-Google-Smtp-Source: AGHT+IF3ydjuFMap6YZ8wj1ug5kT5DXKw4roCiOqxwvp+ZaYsJ/dih12zUlCSoV1xp3bFRu+o/wHBg==
X-Received: by 2002:a17:902:f684:b0:1fb:396c:7541 with SMTP id d9443c01a7336-1ff0481b580mr44070775ad.16.1722213072151;
        Sun, 28 Jul 2024 17:31:12 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7f85868sm70212225ad.238.2024.07.28.17.31.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jul 2024 17:31:11 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <f5886c83-27c2-475d-b75a-4ad107d039ed@roeck-us.net>
Date: Sun, 28 Jul 2024 17:31:09 -0700
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
 <ZqajBUknxDaMp5wy@shikoro>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <ZqajBUknxDaMp5wy@shikoro>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/28/24 12:59, Wolfram Sang wrote:
> Hi Guenter,
> 
> as I mentioned before I now have to deal with SMBusAlert as well and had
> a chance to review and test this series. When developing the SMBAlert
> trigger mechanism for the i2c testunit, I also experienced the interrupt
> storm and your patches helped. See later mails for details.
> 
>> Note that there is one situation which is not addressed by this set of
>> patches: If the corrupted address points to yet another device with alert
>> handler on the same bus, the alert handler of that device will be called.
>> If it is not a source of the alert, we are back to the original problem.
>> I do not know how to address this case.
> 
> I think this can only work if we require .alert-handlers to start with a
> sanity check to make sure their device really raised an interrupt
> condition. And then return either -EBUSY or 0, similar to IRQ_HANDLED or
> IRQ_NONE. Or?
> 

I think so, but I am not sure if it is worth the effort. It would require
changing the API, and each driver supporting alert callbacks would have
to implement code to detect if it actually got an interrupt.

Thanks,
Guenter


