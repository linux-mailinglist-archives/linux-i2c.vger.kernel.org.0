Return-Path: <linux-i2c+bounces-136-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 664AC7EA265
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Nov 2023 18:50:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1C3BB1F2206B
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Nov 2023 17:50:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4470C224C0;
	Mon, 13 Nov 2023 17:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TJk7qqHk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F063E2137E
	for <linux-i2c@vger.kernel.org>; Mon, 13 Nov 2023 17:50:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F37110D0;
	Mon, 13 Nov 2023 09:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699897843; x=1731433843;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=x3fSoSQz6UCNu3JdEMAXXt9H/432BZE0hvyfGRoi6Hc=;
  b=TJk7qqHkioV73o8EbWt4cTfBNc3zwObAQx3WysnvwCBo7sM7VJDn1Kt8
   OGkdFOycbnRouRWs3HAIghP6J6XD5Nq6ibwKxtz/5dDw3oxrNQnSIwyj5
   60gCrMutE/RMAjSUIlyZXJzOVLooB64fZewcJmbX8JG0k6KYZoLnrxClo
   vkBdrLicg9+H4t4YZIRRJpra2uYblih0pxWJ5cPQGJpYny1ZOw066M0ID
   qDU0SYU1XIgSi5lPSaTNUENj0bXpzFwRZO893WODQQbYtfv7iW12xVBue
   +OspGZ24YVBijXvwpwB00ogfPAUGjKjoV/dXt/SlyySYv2S8n76E4m5O/
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="456972051"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="456972051"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 09:50:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="1011613445"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="1011613445"
Received: from cgheban-mobl.ger.corp.intel.com (HELO localhost) ([10.252.55.92])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 09:50:39 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Heiner Kallweit <hkallweit1@gmail.com>, Wolfram Sang <wsa@kernel.org>
Cc: linux-i2c@vger.kernel.org, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 15/20] drivers/gpu/drm/i915/display: remove
 I2C_CLASS_DDC support
In-Reply-To: <6f924890-a5a0-48b4-973d-3c0f88b0d294@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231113112344.719-1-hkallweit1@gmail.com>
 <20231113112344.719-16-hkallweit1@gmail.com> <87sf59vodx.fsf@intel.com>
 <6f924890-a5a0-48b4-973d-3c0f88b0d294@gmail.com>
Date: Mon, 13 Nov 2023 19:50:36 +0200
Message-ID: <878r71tudv.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, 13 Nov 2023, Heiner Kallweit <hkallweit1@gmail.com> wrote:
> On 13.11.2023 13:17, Jani Nikula wrote:
>> On Mon, 13 Nov 2023, Heiner Kallweit <hkallweit1@gmail.com> wrote:
>>> After removal of the legacy EEPROM driver and I2C_CLASS_DDC support in
>>> olpc_dcon there's no i2c client driver left supporting I2C_CLASS_DDC.
>>> Class-based device auto-detection is a legacy mechanism and shouldn't
>>> be used in new code. So we can remove this class completely now.
>> 
>> So this is copy-pasted to all commits and the cover letter, but please
>> do explain why there are no functional changes here (or are there?),
>> without me having to go through the i2c stack and try to find the
>> commits alluded to in "After removal of the legacy ...".
>> 
> Legacy eeprom driver was marked deprecated 4 yrs ago with:
> 3079b54aa9a0 ("eeprom: Warn that the driver is deprecated")
> Now it has been removed with:
> 0113a99b8a75 ("eeprom: Remove deprecated legacy eeprom driver")
>
> Declaration of I2C_CLASS_DDC support is a no-op now, so there's
> no functional change in this patch.
>
> If loaded manually, the legacy eeprom driver exposed the DDC EEPROM
> to userspace. If this functionality is needed, then now the DDC
> EEPROM has to be explicitly instantiated using at24.
>
> See also:
> https://docs.kernel.org/i2c/instantiating-devices.html

I'll take your word for it. Though none of the documentation I can find
say that setting the class is legacy or deprecated or should be
avoided. *shrug*.

Acked-by: Jani Nikula <jani.nikula@intel.com>


>
>
>> What does this mean?
>> 
>> 
>> BR,
>> Jani.
>> 
> Heiner
>
>> 
>>>
>>> Preferably this series should be applied via the i2c tree.
>>>
>>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>>>
>>> ---
>>>  drivers/gpu/drm/i915/display/intel_gmbus.c |    1 -
>>>  drivers/gpu/drm/i915/display/intel_sdvo.c  |    1 -
>>>  2 files changed, 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/display/intel_gmbus.c b/drivers/gpu/drm/i915/display/intel_gmbus.c
>>> index 40d7b6f3f..e9e4dcf34 100644
>>> --- a/drivers/gpu/drm/i915/display/intel_gmbus.c
>>> +++ b/drivers/gpu/drm/i915/display/intel_gmbus.c
>>> @@ -899,7 +899,6 @@ int intel_gmbus_setup(struct drm_i915_private *i915)
>>>  		}
>>>  
>>>  		bus->adapter.owner = THIS_MODULE;
>>> -		bus->adapter.class = I2C_CLASS_DDC;
>>>  		snprintf(bus->adapter.name,
>>>  			 sizeof(bus->adapter.name),
>>>  			 "i915 gmbus %s", gmbus_pin->name);
>>> diff --git a/drivers/gpu/drm/i915/display/intel_sdvo.c b/drivers/gpu/drm/i915/display/intel_sdvo.c
>>> index a636f42ce..5e64d1baf 100644
>>> --- a/drivers/gpu/drm/i915/display/intel_sdvo.c
>>> +++ b/drivers/gpu/drm/i915/display/intel_sdvo.c
>>> @@ -3311,7 +3311,6 @@ intel_sdvo_init_ddc_proxy(struct intel_sdvo_ddc *ddc,
>>>  	ddc->ddc_bus = ddc_bus;
>>>  
>>>  	ddc->ddc.owner = THIS_MODULE;
>>> -	ddc->ddc.class = I2C_CLASS_DDC;
>>>  	snprintf(ddc->ddc.name, I2C_NAME_SIZE, "SDVO %c DDC%d",
>>>  		 port_name(sdvo->base.port), ddc_bus);
>>>  	ddc->ddc.dev.parent = &pdev->dev;
>>>
>> 
>

-- 
Jani Nikula, Intel

