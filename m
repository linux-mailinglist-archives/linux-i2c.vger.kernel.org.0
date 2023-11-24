Return-Path: <linux-i2c+bounces-450-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0588E7F7A5E
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Nov 2023 18:30:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B163C281A71
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Nov 2023 17:30:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CE1E381CB;
	Fri, 24 Nov 2023 17:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SBxm3z/D"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 565D7A4;
	Fri, 24 Nov 2023 09:30:08 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-a00a9d677fcso300018666b.0;
        Fri, 24 Nov 2023 09:30:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700847007; x=1701451807; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YbQAKxaAIC+vWd9ZdBbGyG9cgv4TDOwp1I9wI83Zcsg=;
        b=SBxm3z/D+N5jVPpvc17GcJ+f2F1FewvgMhqZ9oiSDLlmVj44o/xcjn+PcnGTAcPtja
         VtX9ZZLgE9hH7pd6ruh0OotsI3Pci0gqXrtiyq7Y+nWCUUpVHxfUe7zb6Gg3QM72PB64
         Cv+UyJIouvaUt8Z2hmQkgvXZNum//ZnS5lb9H3+9qrXB+jwMr42gwo/0dGuUuRcjNYPC
         hwJHxJqMEmL9VormYyKKWiK9x53hr8VPxFRaLD5lEx7jbFbSuDMiXaADkmqsTXFLNxY6
         m3KmfFOhWJK7zZXl7sWov5mYXdqZovDR8VCAqVJStrizOTAWxmkQhsFuG7/mH8gzleuR
         wnBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700847007; x=1701451807;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YbQAKxaAIC+vWd9ZdBbGyG9cgv4TDOwp1I9wI83Zcsg=;
        b=hIByNfKJnah2Yy/t3MFuBlZHnZ92J1SQDPW5AlSkxnr83f8NVZ4NHc1kAh9PYOkZjI
         E1TlhpynocPAsSJUFsXCCwJ1lzybOlv1ychdzgr38ovOhMu+w49EuVtFTJGC1Qx391rl
         4vJUQNGNllD4Ew/3QTTv1FCjjCBuNzFzk9vacXXWTgbgdwJvuDNAfgak1PtQNnZByXcz
         W7HabRWjWLTEJuER/sKj/SviW85NOBLdrj5qIBC7rfY1YgMSsJ5eOJqN5OooZHuALNqW
         cwHoI5DSq0WZ30xw1NqwNTK9zVZrYVeDshYFajDnbuunxCt+NOeTc1srljMx/D4OEAxX
         o3XA==
X-Gm-Message-State: AOJu0Ywjfq852gzqvsIODIJMZgyXTFiNj9G0DzVAzooY8BxVNymA1sUm
	WvzPi0/XLzFhgcBiruad93c=
X-Google-Smtp-Source: AGHT+IGWbuigfvuGp6kcl40qPQWcJDj2dF5kj1SWoLeoGbjHy8lTPTP3EacK6c7YB/nZDWoV2QNmZA==
X-Received: by 2002:a17:906:b6d3:b0:a03:a3c4:ed99 with SMTP id ec19-20020a170906b6d300b00a03a3c4ed99mr3062176ejb.41.1700847006460;
        Fri, 24 Nov 2023 09:30:06 -0800 (PST)
Received: from ?IPV6:2a01:c22:72cf:8300:64ee:eefa:7128:3642? (dynamic-2a01-0c22-72cf-8300-64ee-eefa-7128-3642.c22.pool.telefonica.de. [2a01:c22:72cf:8300:64ee:eefa:7128:3642])
        by smtp.googlemail.com with ESMTPSA id v11-20020a1709067d8b00b009dddec5a96fsm2323648ejo.170.2023.11.24.09.30.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Nov 2023 09:30:05 -0800 (PST)
Message-ID: <c85f2d02-d862-4431-a210-79c13efd163c@gmail.com>
Date: Fri, 24 Nov 2023 18:30:04 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [bug report] lockdep WARN at PCI device rescan
Content-Language: en-US
To: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Lukas Wunner <lukas@wunner.de>, Keith Busch <kbusch@kernel.org>,
 Wolfram Sang <wsa@kernel.org>, Jean Delvare <jdelvare@suse.de>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>
References: <6xb24fjmptxxn5js2fjrrddjae6twex5bjaftwqsuawuqqqydx@7cl3uik5ef6j>
 <ZVNJCxh5vgj22SfQ@shikoro> <ea31480f-2887-41fe-a560-f4bb1103479e@gmail.com>
 <ZVNiUuyHaez8rwL-@smile.fi.intel.com> <20231114155701.GA27547@wunner.de>
 <ZVOcPOlkkBk3Xfm5@smile.fi.intel.com> <ZVO1M2289uvElgOi@smile.fi.intel.com>
 <eaawoi5jqrwnzq3scgltqxj47faywztn4lbpkz4haugxvgu5df@koy3qciquklu>
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <eaawoi5jqrwnzq3scgltqxj47faywztn4lbpkz4haugxvgu5df@koy3qciquklu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.11.2023 11:49, Shinichiro Kawasaki wrote:
> On Nov 14, 2023 / 19:58, Andy Shevchenko wrote:
>> On Tue, Nov 14, 2023 at 06:11:40PM +0200, Andy Shevchenko wrote:
>>> On Tue, Nov 14, 2023 at 04:57:01PM +0100, Lukas Wunner wrote:
>>>> On Tue, Nov 14, 2023 at 02:04:34PM +0200, Andy Shevchenko wrote:
>>>>> On Tue, Nov 14, 2023 at 11:47:15AM +0100, Heiner Kallweit wrote:
>>>>>> On 14.11.2023 11:16, Wolfram Sang wrote:
>>>>>>> On Tue, Nov 14, 2023 at 06:54:29AM +0000, Shinichiro Kawasaki wrote:
>>
>> ...
>>
>>>>>>>> The lockdep splat indicates possible deadlock between
>>>>>>>> pci_rescan_remove_lock and work_completion lock have deadlock
>>>>>>>> possibility.
>>>>>>>> In the call stack, I found that the workqueue thread for
>>>>>>>> i801_probe() calls p2sb_bar(), which locks pci_rescan_remove_lock.
>>>>>>
>>>>>> i801 just uses p2sb_bar(), I don't see any issue in i801. Root cause
>>>>>> seems to be in the PCI subsystem. Calling p2sb_bar() from a PCI driver
>>>>>> probe callback seems to be problematic, nevertheless it's a valid API
>>>>>> usage.
>>>>>
>>>>> So, currently I'm lack of (good) ideas and would like to hear other (more
>>>>> experienced) PCI developers on how is to address this...
>>>>
>>>> Can you add a p2sb_bar_locked() library call which is used by the
>>>> i801 probe path?
>>>>
>>>> Basically rename p2sb_bar() to __p2sb_bar() and add a third parameter
>>>> of type boolean which signifies whether it's invoked in locked context
>>>> or not, then call that from p2sb_bar() and p2sb_bar_locked() wrappers.
>>>
>>> It may work, I assume. Let me cook the patch.
>>
>> Hmm... But this will open a window when probing phase happens, e.g. during
>> boot time, no? If somebody somehow calls for full rescan, we may end up in
>> the situation when P2SB is gone before accessing it in p2sb_bar().
>>
>> Now I'm wondering why simple pci_dev_get() can't be sufficient in the
>> p2sb_bar().
> 
> All, thanks for the discussion. It looks rather difficult to avoid the WARN.
> 
> To confirm that the deadlock is for real, I tried to remove i2c-i801 device and
> did /sys/bus/pci/rescan with two commands below:
> 
>   # echo 1 > /sys/bus/pci/devices/0000\:00\:1f.4/remove
>   # echo 1 > /sys/bus/pci/rescan
> 
> Then I observed the second command hangs.
> 
> I came across another fix idea: assuming the guard by pci_rescan_remove_lock is
> required in p2sb_bar(), how about to do trylock? If the mutex can not be locked,
> make the p2sb_bar() call fail. This way, we can avoid the deadlock between
> pci_rescan_remove_lock and workqueue completion.
> 
> I created a patch below and confirmed it avoided the lockdep WARN. The i2c-i801
> probe was ok at system boot. When I did the two commands above, I observed the
> i2c-i801 device probe failed due to trylock failure. But I think it's far better
> than hang.
> 

I wouldn't call this a solution. A solution has to support pci drivers using
p2sb_bar() in probe(). You can't simply make them fail.

> 
> diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
> index ed6b7f48736..3e784fb6cd9 100644
> --- a/drivers/pci/probe.c
> +++ b/drivers/pci/probe.c
> @@ -3312,6 +3312,18 @@ void pci_lock_rescan_remove(void)
>  }
>  EXPORT_SYMBOL_GPL(pci_lock_rescan_remove);
>  
> +/*
> + * Try to acquire pci_rescan_remove_lock. Returns 1 if the mutex
> + * has been acquired successfully, and 0 on contention. Use this
> + * to acquire the lock in workqueue context to avoid potential deadlock
> + * together with work_completion.
> + */
> +int pci_trylock_rescan_remove(void)
> +{
> +	return mutex_trylock(&pci_rescan_remove_lock);
> +}
> +EXPORT_SYMBOL_GPL(pci_trylock_rescan_remove);
> +
>  void pci_unlock_rescan_remove(void)
>  {
>  	mutex_unlock(&pci_rescan_remove_lock);
> diff --git a/drivers/platform/x86/p2sb.c b/drivers/platform/x86/p2sb.c
> index 1cf2471d54d..7a6bee8abf9 100644
> --- a/drivers/platform/x86/p2sb.c
> +++ b/drivers/platform/x86/p2sb.c
> @@ -113,7 +113,10 @@ int p2sb_bar(struct pci_bus *bus, unsigned int devfn, struct resource *mem)
>  	 * Prevent concurrent PCI bus scan from seeing the P2SB device and
>  	 * removing via sysfs while it is temporarily exposed.
>  	 */
> -	pci_lock_rescan_remove();
> +	if (!pci_trylock_rescan_remove()) {
> +		pr_err("P2SB device accessed during PCI rescan");
> +		return -EBUSY;
> +	}
>  
>  	/* Unhide the P2SB device, if needed */
>  	pci_bus_read_config_dword(bus, devfn_p2sb, P2SBC, &value);
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index 60ca768bc86..e6db5096217 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -1439,6 +1439,7 @@ void set_pcie_hotplug_bridge(struct pci_dev *pdev);
>  unsigned int pci_rescan_bus_bridge_resize(struct pci_dev *bridge);
>  unsigned int pci_rescan_bus(struct pci_bus *bus);
>  void pci_lock_rescan_remove(void);
> +int pci_trylock_rescan_remove(void);
>  void pci_unlock_rescan_remove(void);
>  
>  /* Vital Product Data routines */


