Return-Path: <linux-i2c+bounces-1158-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C5F825833
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jan 2024 17:31:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5A39D1C217C0
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jan 2024 16:31:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DAA51E52E;
	Fri,  5 Jan 2024 16:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CpALttr6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94BF1E4AD
	for <linux-i2c@vger.kernel.org>; Fri,  5 Jan 2024 16:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704472302;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r/SMYeq6MZXzMQtF1ocoD2Li5uj/51chuVycCCFnkcI=;
	b=CpALttr6r8h52SiYWBlLvT2OdgsqoCe5RIGLlTMftACDGT+0cqZT2RHLA/tEUGRHf5B3Rh
	o8KgRxhGwR3F09t3hnk/Y3khLGvFEcTHH957sUojjNSrzpz8l4p68+NrC39IdH1G3TwUtc
	j0CoQRHj13KrhSZ6sBYSWo72jlF6HPs=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-198-MOoAxZ9_NyOHbsxvKl_SVQ-1; Fri, 05 Jan 2024 11:31:36 -0500
X-MC-Unique: MOoAxZ9_NyOHbsxvKl_SVQ-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a27eddc1c27so97566866b.3
        for <linux-i2c@vger.kernel.org>; Fri, 05 Jan 2024 08:31:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704472294; x=1705077094;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r/SMYeq6MZXzMQtF1ocoD2Li5uj/51chuVycCCFnkcI=;
        b=YqAJnUcf25KEGvCJlg9Q+FjOgZWSzKLJ4Oa5v/0JpZ32v6ZHI4icOMFE3HrWvfvOZc
         7w0B5/VmIdFWMTEnuwHimQ0bNXW2jXinPHiNqZkSkdwxRPCQHi88rn/S8SfaQUQz877G
         LlW9XriepIqb2cU2u6lbSiw1INXeqg8RAALPaUb0/vtL9d9LCtKw5MH19MVfdgqi31n1
         qkGR1vn0l5YyXMRjS0SYedGMPtWueBx8rdckhp7xA+xP/0L893Fx6UyVBv9UBXf1jgim
         ir5a1D6Hp7F2VrLBSPD4HTbHOu6u69jqVqaoLcUguEe/YYIABXOBsyqSUjtS+nNWZKLi
         k09g==
X-Gm-Message-State: AOJu0YwF4hq7ZHK8ZPde8GdB5iyYV3xLer9VmpCu9WPl7h16Kq+CGKiV
	q1iaoQcnG5AYi8mw88XBV9gf6hFNBgtarhZ+wpLqGXUE+pdXLYvSmNeiKA8niKDoiqrmqpRUi8u
	ICntVtY1nhI9h5OyAzoULjgk5FW0VrlRJ6wge
X-Received: by 2002:a17:906:53d1:b0:a28:a8b9:5e1c with SMTP id p17-20020a17090653d100b00a28a8b95e1cmr850708ejo.53.1704472294422;
        Fri, 05 Jan 2024 08:31:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFgYLmMGNPdM9ZK4NCOoHG5Vxk/coeeXwBtnzkwahRTH09yJXqxG1aQYNJcbeeVBjJczsGcew==
X-Received: by 2002:a17:906:53d1:b0:a28:a8b9:5e1c with SMTP id p17-20020a17090653d100b00a28a8b95e1cmr850699ejo.53.1704472294106;
        Fri, 05 Jan 2024 08:31:34 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id x17-20020a170906297100b00a26e4986df8sm1039203ejd.58.2024.01.05.08.31.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jan 2024 08:31:33 -0800 (PST)
Message-ID: <a37ddb76-c93e-4422-80eb-11dae0985093@redhat.com>
Date: Fri, 5 Jan 2024 17:31:32 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] platform/x86: dell-smo8800: Move instantiation of
 lis3lv02d i2c_client from i2c-i801 to dell-smo8800
Content-Language: en-US, nl
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
 Eric Piel <eric.piel@tremplin-utc.net>, Paul Menzel <pmenzel@molgen.mpg.de>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Dell.Client.Kernel@dell.com,
 Marius Hoch <mail@mariushoch.de>, Kai Heng Feng
 <kai.heng.feng@canonical.com>, Wolfram Sang <wsa@kernel.org>,
 platform-driver-x86@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20231224213629.395741-1-hdegoede@redhat.com>
 <20231224213629.395741-4-hdegoede@redhat.com>
 <20231224215502.dq6a2sq2hdfrpwof@pali>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231224215502.dq6a2sq2hdfrpwof@pali>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Pali,

On 12/24/23 22:55, Pali Rohár wrote:
> On Sunday 24 December 2023 22:36:19 Hans de Goede wrote:
>> +static int smo8800_find_i801(struct device *dev, void *data)
>> +{
>> +	static const u16 i801_idf_pci_device_ids[] = {
>> +		0x1d70, /* Patsburg (PCH) */
>> +		0x1d71, /* Patsburg (PCH) */
>> +		0x1d72, /* Patsburg (PCH) */
>> +		0x8d7d, /* Wellsburg (PCH) */
>> +		0x8d7e, /* Wellsburg (PCH) */
>> +		0x8d7f, /* Wellsburg (PCH) */
>> +	};
> 
> I'm not happy with seeing another hardcoded list of device ids in the
> driver. Are not we able to find compatible i801 adapter without need to
> hardcode this list there in smo driver?

I agree that having this hardcoded is not ideal.

The problem is that for a couple of generations (Patsburg is for
Sandy Bridge and Ivybridge and Wellsburg is for Haswell and Broadwell)
intel had multiple i2c-i801 controllers / I2C-busses in the PCH
and the i2c_client needs to be instantiated on the primary
i2c-i801 (compatible) controller.

Luckily Intel has only done this for these 2 generations PCH
all older and newer PCHs only have 1 i2c-i801 I2C bus.

So even though having this hardcoded is not ideal,
the list should never change since it is only for
this 2 somewhat old PCH generations and new generations
are not impacted. So I believe that this is the best
solution.

Regards,

Hans



	

> And if really not, what about
> sharing (or exporting) list from the i801 driver?
> 
> I'm just worried that this PCI id list will increase in the future and
> it would be required to add a new and new id into it...
> 
>> +	struct i2c_adapter *adap, **adap_ret = data;
>> +	struct pci_dev *pdev;
>> +	int i;
>> +
>> +	adap = i2c_verify_adapter(dev);
>> +	if (!adap)
>> +		return 0;
>> +
>> +	if (!strstarts(adap->name, "SMBus I801 adapter"))
>> +		return 0;
>> +
>> +	/* The parent of an I801 adapter is always a PCI device */
>> +	pdev = to_pci_dev(adap->dev.parent);
>> +	for (i = 0; i < ARRAY_SIZE(i801_idf_pci_device_ids); i++) {
>> +		if (pdev->device == i801_idf_pci_device_ids[i])
>> +			return 0; /* Only register client on main SMBus channel */
>> +	}
>> +
>> +	*adap_ret = i2c_get_adapter(adap->nr);
>> +	return 1;
>> +}
> 


