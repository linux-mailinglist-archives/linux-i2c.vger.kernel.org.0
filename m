Return-Path: <linux-i2c+bounces-6427-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C6658972122
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 19:40:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F31E1F24423
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 17:40:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4DC617DFE3;
	Mon,  9 Sep 2024 17:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eZYtqSuq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1689E17B515;
	Mon,  9 Sep 2024 17:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725903142; cv=none; b=VHgQrQU+JSfVoxYgPwIDNdBP8Mi+ELSTgTHQATyPkF6tfEe0d4DBO6VLjbL0v5MQrjrr/SmiNtPnPj1UAqLX1yVBEszR285+rkHEgnPL1hDxiR461OWJfcde1JFXow+CZ6ZpTXYUvr7goK/tu1N/fiaeA+FUFgDt8Nw0ZU9ANiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725903142; c=relaxed/simple;
	bh=Fa//dzK2+R9pjCDv2/KY3uDSSRSAKYcnyxyiZxr6g4A=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=SiTL/eK36biIUZMfAAfZkrFPvR6MOh3rWtFlblYRNIjJpto66/yJZ1Br/yikBkgm0HF+3ZlEMnfHxv7bbnr4Xro98mxSLV6Ni8jj37laoOHogsH/VISVyuf6PiqbE/+AtYybbwRrfDK9vV+/VBCMtJlzKMdl+CAEEkvQo0b8rY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eZYtqSuq; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a8a7929fd64so576816166b.0;
        Mon, 09 Sep 2024 10:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725903139; x=1726507939; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HhGCllT9xKn/sLlUhRUPHw9Uy7obMttI3jetj+00nF4=;
        b=eZYtqSuqzxpiC8gWGV0FkKM1giyIS/IlIE/33bbQk+eP9Ssg9F/r19bmW4uu5aEzYn
         IZyo5DB/kMYCmOSQW8nnOXAlJ4ek2JEjhcqZp7fmVJHMdliitqM7hfJegB0u/ZXm+YKY
         C4W3QfFKqR1G0kHltiO2qDdnkMcfl/XrFM/F1GEZD3+DrgNMNEKsHJAD20gUHa+FDwmL
         HNZGrRLybXmYZgOW0/ked0fwVDF9J5u69+2vN18mqUC2v57oj2idJHP5J6Vz2KFqvq4j
         K5mU7/H/klMa9n7jBG+tfV1INA7lzvBBdOTJEXzjGl36OATtN27fuGlaz/VYRoM5lUqZ
         CRpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725903139; x=1726507939;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HhGCllT9xKn/sLlUhRUPHw9Uy7obMttI3jetj+00nF4=;
        b=eeLgFYfPHYcGYhyzvq71ZQ8U8kSaRfdJgdaaZDwXX4cvoxPqoR3mAdBraNrpEJNcsn
         +730LxlOFMGN9jf1Kn/Y9YMF7P376D43DgJCIUkSUfvVAIArFpzohHOcNmseYQqE5CDf
         pAnoFQtH+k0uVsjbTJn2Tj9C2kZo4EahUNPSPIsvZabh+CYP9vGTFKd9hxGusiAsfO1H
         yuHQmmK5uzR4oGR/zHmfybOQUE0PkptJrg/iS2MTnrhRywrHLb3Eto5VTWd4iBRRy+no
         Uo/ZCE3RngjegtngQW6M3IpLB6KYAIP8/dbvLLUDWWaAzAy2v2SVPVKdGJj+dEcdoHKY
         heOg==
X-Forwarded-Encrypted: i=1; AJvYcCUYSB/vtppYNEjMVTHqbHz6RgPxSWKgC7W3XE0wWHAW7Mp2K45H5uoM+AuYVD34v9CEBLGCEoysP3r5mQ==@vger.kernel.org, AJvYcCVojbIi7r+DMLWv57r7q25uz9t3K52YVrxIeZgTHt05RXue22E5g4JZPdrD9B1p4B2cm6sFnP/iXtYaYvo=@vger.kernel.org, AJvYcCWWSiBS8m14Wsieid6X2xmyG8xBkLF/yjA1ywf4lokwhP2ElMwGG7+E5X2eTUw1HodpKbVzQPTCMcyq@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+mVgh4f06u5ICnfUnXCvQcwiU/RJg8uMHEGMRtX3ILXr+8tVj
	skT3bKZVr6UhQ2eilUcrzre66eS983vtTVbbIDiStG/+0VKfjEVP
X-Google-Smtp-Source: AGHT+IFNsreaicf5CUE8J1Bbypl5Xih/k65GkOcn/VHRKMo26l6AQrPiVcWjEOAMczu8cTPont0gvQ==
X-Received: by 2002:a17:907:920a:b0:a8a:8c4c:3e2a with SMTP id a640c23a62f3a-a8a8c4c3ecfmr593393366b.23.1725903138319;
        Mon, 09 Sep 2024 10:32:18 -0700 (PDT)
Received: from [192.168.0.17] (cable-178-148-235-7.dynamic.sbb.rs. [178.148.235.7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25d40064sm369234066b.190.2024.09.09.10.32.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Sep 2024 10:32:17 -0700 (PDT)
Message-ID: <83d6250a-c474-4d0a-b5e0-922b4bc35bd8@gmail.com>
Date: Mon, 9 Sep 2024 19:32:16 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: savicaleksa83@gmail.com, linux-input@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH -next v2 09/15] hwmon: Use devm_hid_hw_start_and_open in
 rog_ryujin_probe()
To: Li Zetao <lizetao1@huawei.com>, jikos@kernel.org, bentiss@kernel.org,
 michael.zaidman@gmail.com, gupt21@gmail.com, djogorchock@gmail.com,
 roderick.colenbrander@sony.com, me@jackdoan.com, jdelvare@suse.com,
 linux@roeck-us.net, mail@mariuszachmann.de, wilken.gottwalt@posteo.net,
 jonas@protocubo.io, mezin.alexander@gmail.com
References: <20240909012313.500341-1-lizetao1@huawei.com>
 <20240909012313.500341-10-lizetao1@huawei.com>
Content-Language: en-US
From: Aleksa Savic <savicaleksa83@gmail.com>
In-Reply-To: <20240909012313.500341-10-lizetao1@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2024-09-09 03:23:07 GMT+02:00, Li Zetao wrote:
> Currently, the rog_ryujin module needs to maintain hid resources
> by itself. Use devm_hid_hw_start_and_open helper to ensure that hid
> resources are consistent with the device life cycle, and release
> hid resources before device is released. At the same time, it can avoid
> the goto-release encoding, drop the fail_and_close and fail_and_stop
> lables, and directly return the error code when an error occurs.
> 
> Further optimization, use devm_hwmon_device_register_with_info to replace
> hwmon_device_register_with_info, the remote operation can be completely
> deleted, and the rog_ryujin_data structure no longer needs to hold
> hwmon device.
> 
> Signed-off-by: Li Zetao <lizetao1@huawei.com>

Reviewed-by: Aleksa Savic <savicaleksa83@gmail.com>


