Return-Path: <linux-i2c+bounces-5200-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E7B94B379
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Aug 2024 01:14:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4AF8D1C21836
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Aug 2024 23:14:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9768155A59;
	Wed,  7 Aug 2024 23:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MeKbRIwU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4318B1553BC;
	Wed,  7 Aug 2024 23:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723072484; cv=none; b=LqAYaZ7FSFrlxH38u81VQGbkxu675PawMM+ghAQifmW2CrFnv3EdgkYgznzGQ3K3sc9ghnZh16aWsiGYpPkKeffVbTZ9mYgaIhfo/NQfS0Gpk6WHwatN+KvEmac1VKEWZDzOz4MaVf3m7nwXdCAg4r7fvmtVFFHYUI3nUHRCoFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723072484; c=relaxed/simple;
	bh=rlvbH7U0JcMra9lxPNNeEXVHhjO7TnrdcHTeom1Fcis=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uaVUvBuEcjDZT5JG7ox5gUQe2JnLJAVxXYBrZ0Ke516K5FKUVXBq98O5QFDdJio9qqsM2TWSSJFckVxy4exKipJcVRGFop+tzYwWiOWk0lRPtYKA0vo0fsLq3WC1SveiojVKngFNTMDAirCETke3gY6V5uZjHIV+LblSQCkz7ZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MeKbRIwU; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-5d5d0535396so237607eaf.1;
        Wed, 07 Aug 2024 16:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723072482; x=1723677282; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nc+02bBxrPU3z7YbfbXPiG3TdH9ZHpsAB6H/P49aAMI=;
        b=MeKbRIwUzsIgRJBK/akDoIunU0Ieoog7Dc3Z386RDPDYzIyIDW79UNlOzoSqrX3WVj
         Jd1XBJ+D/LQG9rggxpb9rGc1Y+k8e4f2dsAQCBUNoAvcewNT/C7XKmtQksHpy1+JNZuz
         xRSCC/ngOdBmc+SA331InpuL1eYv0ZDMQiwsVTU4QZZJcaYf9x/RQKkoyjxKTgVzdADJ
         FC917216Gv5DETIT1Bj7Ef/qNZnXZjYQIUujmwH6qJvhPql3JextgQewgxJ+6SLJtwzl
         kvWat90MJWgpJRbHJyiVGi+/pZmwoi47mTUyQH4lNpltip/Drib87HrCPkJgRBGj2AtK
         vLaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723072482; x=1723677282;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nc+02bBxrPU3z7YbfbXPiG3TdH9ZHpsAB6H/P49aAMI=;
        b=jfa7CkhScLCaXWJNUCsaDT6S2LreAzmKWBbja0587oF4u3TELUmkklomM/iPKPl6J7
         TXS6dzd8Te21yFCKjQ0uxIS38UHGyGI7VYl9Aa5qOF2J//gKwck+E92HgFOGWVOAw1rM
         ALF+z4pTeFaCtKPxtJXDGSF7QKiNNBMujVUBp8LxlYdh1/fsUQZe1IKf8bigfy/R2qLQ
         M8/trgko666XXucIy9Rkk6fnqSN7rf/eSHPeubjtxUdmuEdYT3smOF+X4U9plC6TTsn3
         lVWP0wl7R13CKu0RaifHRk/jzzh6nXME0AqkHveXlUWaHZaYHLxUIkuoRQ0t+mZ2sA0D
         5NwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbmJPEvLsBVW3ieWZeEH4TkQ/g1jURjfUw4F/6vmAMFIHqksnPG+JGGz4NHuxtv/+NTppEGhP+Tamffb/4EdCUvQ8I1VupQM1+V9WHcetohNgWkDCmX7IpWvPlgRW31uHwg8pZPfpAMWu41U1F5oNL/gxsas4RwAj0Yz73wBOsTdYoGqWUVmsaeY/8J6OnZ9Ct8WQxc7EUhQsBO70Yh1V3dQ==
X-Gm-Message-State: AOJu0YwvSRQDumGsc2/ZScnhkxbaSjd1m20UOtPxh+iwvKCGph5cpyC7
	Xs3yGJBo86PN6JwL/mcDdvEdNqmo98DmQvfHj6L0IZtRKxhmLw92+R8rLPfK
X-Google-Smtp-Source: AGHT+IFVKAcqwxIm7XFe0JFRilJfmv0FqcpDOsLEIsUbljBi0ODx1QcAQqBLXH+JSeqngoUP8VkUmQ==
X-Received: by 2002:a05:6870:8a07:b0:25e:1711:90e3 with SMTP id 586e51a60fabf-2692b61b17cmr175018fac.2.1723072482302;
        Wed, 07 Aug 2024 16:14:42 -0700 (PDT)
Received: from localhost ([2607:fea8:52a3:d200:324c:b818:b179:79b])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a3786b5680sm100993885a.100.2024.08.07.16.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 16:14:42 -0700 (PDT)
Date: Wed, 7 Aug 2024 19:14:40 -0400
From: Richard Acayan <mailingradian@gmail.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-i2c@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: media: camss: Add qcom,sdm670-camss
Message-ID: <ZrP_4NRIfo71wDwo@radian>
References: <20240806224219.71623-7-mailingradian@gmail.com>
 <20240806224219.71623-9-mailingradian@gmail.com>
 <81192a77-ec22-45bd-91d6-4a0ec381a6f3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <81192a77-ec22-45bd-91d6-4a0ec381a6f3@linaro.org>

On Tue, Aug 06, 2024 at 11:57:38PM +0100, Bryan O'Donoghue wrote:
> On 06/08/2024 23:42, Richard Acayan wrote:
>> Add the camera subsystem for the Snapdragon 670.
>> 
>> Adapted from SC8280XP camera subsystem.
>
> Hmm, I'd like a little bit more of a commit log here. sdm670 as found in
> "spiffy device X" contains N CSIDs, Y VFEs.
>
> Its not super important but a description that is device specific would be
> nice.

Ok.

>> 
>> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
>> ---
>>   .../bindings/media/qcom,sdm670-camss.yaml     | 353 ++++++++++++++++++
>>   1 file changed, 353 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
>> 
>> diff --git a/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
>> new file mode 100644
>> index 000000000000..543fad1b5cd7
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
>> @@ -0,0 +1,353 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
>> +
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/media/qcom,sdm670-camss.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm SDM670 Camera Subsystem (CAMSS)
>> +
>> +maintainers:
>> +  - Richard Acayan <mailingradian@gmail.com>
>> +
>> +description:
>> +  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,sdm670-camss
>> +
>> +  clocks:
>> +    maxItems: 33
>> +
>> +  clock-names:
>> +    items:
>> +      - const: camnoc_axi
>> +      - const: cpas_ahb
>> +      - const: cphy_rx_src
>> +      - const: csi0
>> +      - const: csi0_src
>
> These "_src" clocks should be dropped.

Hi, this will require dedicated definitions for SDM670 in the driver, as
SDM845 lists (and requires) the src clocks. It's certainly possible to
do so, but I'm just not sure if it's what you expected.

Or I could send an RFT to drop them from SDM845...

