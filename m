Return-Path: <linux-i2c+bounces-12914-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DAABB547C3
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Sep 2025 11:34:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C64E3A3DB6
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Sep 2025 09:31:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E4682900A8;
	Fri, 12 Sep 2025 09:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m7dEpU53"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8031428C874
	for <linux-i2c@vger.kernel.org>; Fri, 12 Sep 2025 09:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757669255; cv=none; b=MlE6jV1bX4ONdSWfQGavYNcbLGAO8RGK9n1tmTSMerGYTvHGntiyxvZ2ly1udDdCsTzBXxQbRLN04VbmcdUw/q5e4uwuJJAHylkm2lX0swEgTMXFAw8qpEbwabne4rEiw4zmsKkAT2TbllnnDjeHZ+bqj8Pe4G2nqXUGO919RsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757669255; c=relaxed/simple;
	bh=gfb3JWg2h2wLQhK4UM6/FHhhzCI5uALXsimWBNV6NQg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UT7lx/7TEi+GBaXLPwYl9xTGpLrC9JDWoKa8EmHRtkmKqd45D7srAn122mMsP095RR9mXEw85F0lz3L5XBNpqS5U0qlLw9K+njM5ZL22pFzeveaJhMTj0Aaq2M7rVfuRxvnrDGW/rAM6ogKx0eYqSRImYuizLRkI9gedd02Vujk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m7dEpU53; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3e7643b0ab4so853305f8f.2
        for <linux-i2c@vger.kernel.org>; Fri, 12 Sep 2025 02:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757669252; x=1758274052; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kXTEITSzQJNG4FjEV+hS6a+GXTf9khmRm1tSXLrtGVY=;
        b=m7dEpU539YkuMk+HjGAlAb2g9NHmyecjpnoR1tGRljWMsSvfcURCKp6bS6eEvh16jf
         IEo0JpqDwLhKNlY1KrZO2yyu/3GbPKKrwioFjogbcnrgWa32jbswKy2llxEnaHpbLsXC
         3ctMFzst0L+btHshvkQ19p0L9aRU5F46X/MaTZ39AmRHl8Ow8p5edj/XFNCqzql5yOUY
         4OS6xCfAeg53yoil07rl5yk15vdoX/c1kO7Ri8JCmzfb0S+ZUeDcYZ5OiJlx1nggZEx0
         EhLaj4yNq3xO2YRrws2isUwKxUXw0Hu06BiejtC5OHp0uknlggiCZkywg0hNb0/CUPkF
         0AMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757669252; x=1758274052;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kXTEITSzQJNG4FjEV+hS6a+GXTf9khmRm1tSXLrtGVY=;
        b=c5efm1UxwfTmdOC2iMZwLpfDfK89XHwyTedjHmts42m6tEazCILqEjRZg4Es6edoS6
         rv3IWZpmBMwKGa1Kj6amnaPQ/1Cjimzf8wXHZMAT4cFKE0NubZJOjRpqTYpGqjU7Xpd2
         w8Wxufcog+A7fsyEuL8QeXzDnfmvarFJqaCfVuWRT9gmB4U9yRy4Gb06RGcIoRBAU48O
         J3YgtCbXwADO+q7bWMKTEDuEp4LjDSZVc9RhKBdgUacjKmn9s7rW7dSXY2/hL0x0v9eg
         nR06CDtsnl4v8XLlRyW/JEIknCAhSeymRYJ7aY7mvpqET1xpUJTFhaoQWA3sbXeU8NRN
         ttoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhIgeadnbrGDiTzB5LsG3ItOiPROHJIosdTVtQvxt5GGC66/ACHTlo02u6eY9RsFZfflRkCYGUOH4=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa/N5W8ILp6EeV1uolxQx7lRKH6hcayTqk0m1/24VF5T/ESPpD
	dGr0ca9VnYg2NV9NFoJbNdaViMg1KbbCc2crNXyfdg90ogE5SSiK7k1UGYjZJ8FFF9E=
X-Gm-Gg: ASbGncvJ7lnGIuCc4rsy0A8z4AEgTiN1FVhkbTUHlKN301gF28Vyr0cJ+4sHGo/82B2
	nIPtQnRyatveBzgD7B6mQgWe3njOxoZJU2vawa1iRIEhjbwjgkH5F7LDrFp640ffTXpU+wGUGPw
	DFqvbcnVYYw3NR990DgiBrRKmFf56XbTMiJ8a1tzo3910CmpdhLai5KvaLlQZXa4xN13i+tvd05
	WVp59Uw85lzJbsv7QGIUUTRaFLRfLZdQ8JJuR5g9eWkGJlmN3PTS+JFXtRtzYftnun0s+EERhSv
	hiuvjUljAUmJEQXIspyb6l8ralXaq6t0bzYZ16mQ3wBW7MSaEHDtwgxMNFyYWx3uL9thxznoxk1
	W3R7y/bRujD/8GanZ7MdzeKBGm4+KO+uHDvx1rYQerJGiGvWdZQT8IQvPZhSWTaRKrly8mPyqLD
	wvrANRVggFRxERdbLZqmyX8ccx1TtZuA==
X-Google-Smtp-Source: AGHT+IHRwP5h9u64faaN9sgkAgvq6Wk5wiLsJZGVMHzOBMSe2Z0sqeUItiFW4+Kj3CxqqJN1+tBQMQ==
X-Received: by 2002:a05:6000:1846:b0:3da:37de:a3c2 with SMTP id ffacd0b85a97d-3e765796575mr2314314f8f.24.1757669251882;
        Fri, 12 Sep 2025 02:27:31 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e760775868sm5886336f8f.1.2025.09.12.02.27.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 02:27:31 -0700 (PDT)
Message-ID: <2a96dfd9-a5d3-479a-a60d-698e0c235d2a@linaro.org>
Date: Fri, 12 Sep 2025 10:27:27 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: lemans-evk-camera: Add DT
 overlay
To: Wenmeng Liu <quic_wenmliu@qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, vladimir.zapolskiy@linaro.org,
 todor.too@gmail.com, linux-i2c@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250911-camss_rb8-v5-0-c078e4e22d91@oss.qualcomm.com>
 <20250911-camss_rb8-v5-3-c078e4e22d91@oss.qualcomm.com>
 <ex5oojf6lqti45joyjxpyi2ev4mjcitw4lz6cszu6lustrby4j@zzigwnu4pbxo>
 <39cb76ef-3f51-438d-b740-827a4c70035a@qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <39cb76ef-3f51-438d-b740-827a4c70035a@qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/09/2025 03:23, Wenmeng Liu wrote:
> 
> Would lemans-evk-camera-csi1-imx577.dtso be a more appropriate name?
> It more precisely describes the content of the dtso.

I think that's a good idea.

For example if you added another sensor to the mezzanine board on csi4 
an ov9282 say

lemans-evk-camera-csi4-ov9282.dtso

The only problem with that is you can only enable the camera in one dtso

But that feels like a problem to be solved only when someone upstreams 
more than one sensor for this mezzanine.

---
bod


