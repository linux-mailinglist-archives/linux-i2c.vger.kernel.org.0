Return-Path: <linux-i2c+bounces-5076-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B7EC193EEAB
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Jul 2024 09:41:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 431F61F21B08
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Jul 2024 07:41:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B62E12BF25;
	Mon, 29 Jul 2024 07:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Ys6Gckpk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jGS9ZrtO";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Ys6Gckpk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jGS9ZrtO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45FA412A177;
	Mon, 29 Jul 2024 07:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722238891; cv=none; b=hDU27+cglXAoXSuWcGQFpeECk6kCgq5MoFN2Vblq8RlhexWjLfeGEqO0EIm8P1X7bvogY6w73iWPHNMLbJqPh66VgGoBBRpDuncZob9IDshjdzK2ujRE8JZmhHU/KT6X5oLyJURokLncr9pmDSlBh1d57Q0Zs1d50Us8vlNFxXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722238891; c=relaxed/simple;
	bh=FSvQO4GwYManfgou3e/hiz9BUrL9XqREtSqqjzKovxI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FCsdqeZ8sGx5L+SLFXdCYxmgWTzPAE18580b7Pl3K1VqY7/PEUlyxlu/nKjn3h6R1fPEK7N7jURM4buWDD/ik1HZp2eYE+nM3XUOUHepEAEe+FCfpYwBkiBvH8w7kvFPg93L8ozQ709o/nTyZML3DDYDR+vwi9T1oY962Cg0pJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Ys6Gckpk; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jGS9ZrtO; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Ys6Gckpk; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jGS9ZrtO; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3FC431FD88;
	Mon, 29 Jul 2024 07:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722238887; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=4xNjY0qThT+/N6RDf6KsfakSFzP4XXLjkYAKEeZugEg=;
	b=Ys6Gckpk/NcoZREJ81ZRY2DGWrd1EtMLAHLmJicKO6huCCqkPzm8ZFPpoghODwatFGk5Bl
	AJbO9jPrfjrTvTNfjJDYhu3NP+tiKO6AKohflq6mya0GnvAMrVLVHJaelh5Sf7g5KLzUGb
	IWPsUEmFRWtddTrOI/c09vaiRwdEBdk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722238887;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=4xNjY0qThT+/N6RDf6KsfakSFzP4XXLjkYAKEeZugEg=;
	b=jGS9ZrtOfm8dI0JUlFG5XP5WWYVRToFFEmPlRg9fquluwe0/t4Ehoeh4CZZODASJln9AF8
	dtob7RMraVjL/kBw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722238887; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=4xNjY0qThT+/N6RDf6KsfakSFzP4XXLjkYAKEeZugEg=;
	b=Ys6Gckpk/NcoZREJ81ZRY2DGWrd1EtMLAHLmJicKO6huCCqkPzm8ZFPpoghODwatFGk5Bl
	AJbO9jPrfjrTvTNfjJDYhu3NP+tiKO6AKohflq6mya0GnvAMrVLVHJaelh5Sf7g5KLzUGb
	IWPsUEmFRWtddTrOI/c09vaiRwdEBdk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722238887;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=4xNjY0qThT+/N6RDf6KsfakSFzP4XXLjkYAKEeZugEg=;
	b=jGS9ZrtOfm8dI0JUlFG5XP5WWYVRToFFEmPlRg9fquluwe0/t4Ehoeh4CZZODASJln9AF8
	dtob7RMraVjL/kBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AFC7D1368A;
	Mon, 29 Jul 2024 07:41:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id KOARKaZHp2YJaQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Mon, 29 Jul 2024 07:41:26 +0000
Message-ID: <47d9be0c-bb16-4b05-9f7a-41c019add0fe@suse.de>
Date: Mon, 29 Jul 2024 09:41:26 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/6] drm/gma500: Make I2C terminology more inclusive
To: Easwar Hariharan <eahariha@linux.microsoft.com>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS"
 <intel-gfx@lists.freedesktop.org>,
 "open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS"
 <intel-xe@lists.freedesktop.org>,
 "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
 "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>
References: <20240711052734.1273652-1-eahariha@linux.microsoft.com>
 <20240711052734.1273652-3-eahariha@linux.microsoft.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <20240711052734.1273652-3-eahariha@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.59 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	FREEMAIL_TO(0.00)[linux.microsoft.com,gmail.com,linux.intel.com,kernel.org,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	TAGGED_RCPT(0.00)[renesas];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -2.59

I merged this patch into drm-misc-next.

Am 11.07.24 um 07:27 schrieb Easwar Hariharan:
> I2C v7, SMBus 3.2, and I3C 1.1.1 specifications have replaced "master/slave"
> with more appropriate terms. Inspired by Wolfram's series to fix drivers/i2c/,
> fix the terminology for users of I2C_ALGOBIT bitbanging interface, now that
> the approved verbiage exists in the specification.
>
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
> ---
>   drivers/gpu/drm/gma500/cdv_intel_lvds.c |  2 +-
>   drivers/gpu/drm/gma500/intel_bios.c     | 22 ++++++++++-----------
>   drivers/gpu/drm/gma500/intel_bios.h     |  4 ++--
>   drivers/gpu/drm/gma500/intel_gmbus.c    |  2 +-
>   drivers/gpu/drm/gma500/psb_drv.h        |  2 +-
>   drivers/gpu/drm/gma500/psb_intel_drv.h  |  2 +-
>   drivers/gpu/drm/gma500/psb_intel_lvds.c |  4 ++--
>   drivers/gpu/drm/gma500/psb_intel_sdvo.c | 26 ++++++++++++-------------
>   8 files changed, 32 insertions(+), 32 deletions(-)
>
> diff --git a/drivers/gpu/drm/gma500/cdv_intel_lvds.c b/drivers/gpu/drm/gma500/cdv_intel_lvds.c
> index f08a6803dc184..c7652a02b42ec 100644
> --- a/drivers/gpu/drm/gma500/cdv_intel_lvds.c
> +++ b/drivers/gpu/drm/gma500/cdv_intel_lvds.c
> @@ -565,7 +565,7 @@ void cdv_intel_lvds_init(struct drm_device *dev,
>   			dev->dev, "I2C bus registration failed.\n");
>   		goto err_encoder_cleanup;
>   	}
> -	gma_encoder->i2c_bus->slave_addr = 0x2C;
> +	gma_encoder->i2c_bus->target_addr = 0x2C;
>   	dev_priv->lvds_i2c_bus = gma_encoder->i2c_bus;
>   
>   	/*
> diff --git a/drivers/gpu/drm/gma500/intel_bios.c b/drivers/gpu/drm/gma500/intel_bios.c
> index 8245b5603d2c0..d5924ca3ed050 100644
> --- a/drivers/gpu/drm/gma500/intel_bios.c
> +++ b/drivers/gpu/drm/gma500/intel_bios.c
> @@ -14,8 +14,8 @@
>   #include "psb_intel_drv.h"
>   #include "psb_intel_reg.h"
>   
> -#define	SLAVE_ADDR1	0x70
> -#define	SLAVE_ADDR2	0x72
> +#define	TARGET_ADDR1	0x70
> +#define	TARGET_ADDR2	0x72
>   
>   static void *find_section(struct bdb_header *bdb, int section_id)
>   {
> @@ -357,10 +357,10 @@ parse_sdvo_device_mapping(struct drm_psb_private *dev_priv,
>   			/* skip the device block if device type is invalid */
>   			continue;
>   		}
> -		if (p_child->slave_addr != SLAVE_ADDR1 &&
> -			p_child->slave_addr != SLAVE_ADDR2) {
> +		if (p_child->target_addr != TARGET_ADDR1 &&
> +			p_child->target_addr != TARGET_ADDR2) {
>   			/*
> -			 * If the slave address is neither 0x70 nor 0x72,
> +			 * If the target address is neither 0x70 nor 0x72,
>   			 * it is not a SDVO device. Skip it.
>   			 */
>   			continue;
> @@ -371,22 +371,22 @@ parse_sdvo_device_mapping(struct drm_psb_private *dev_priv,
>   			DRM_DEBUG_KMS("Incorrect SDVO port. Skip it\n");
>   			continue;
>   		}
> -		DRM_DEBUG_KMS("the SDVO device with slave addr %2x is found on"
> +		DRM_DEBUG_KMS("the SDVO device with target addr %2x is found on"
>   				" %s port\n",
> -				p_child->slave_addr,
> +				p_child->target_addr,
>   				(p_child->dvo_port == DEVICE_PORT_DVOB) ?
>   					"SDVOB" : "SDVOC");
>   		p_mapping = &(dev_priv->sdvo_mappings[p_child->dvo_port - 1]);
>   		if (!p_mapping->initialized) {
>   			p_mapping->dvo_port = p_child->dvo_port;
> -			p_mapping->slave_addr = p_child->slave_addr;
> +			p_mapping->target_addr = p_child->target_addr;
>   			p_mapping->dvo_wiring = p_child->dvo_wiring;
>   			p_mapping->ddc_pin = p_child->ddc_pin;
>   			p_mapping->i2c_pin = p_child->i2c_pin;
>   			p_mapping->initialized = 1;
>   			DRM_DEBUG_KMS("SDVO device: dvo=%x, addr=%x, wiring=%d, ddc_pin=%d, i2c_pin=%d\n",
>   				      p_mapping->dvo_port,
> -				      p_mapping->slave_addr,
> +				      p_mapping->target_addr,
>   				      p_mapping->dvo_wiring,
>   				      p_mapping->ddc_pin,
>   				      p_mapping->i2c_pin);
> @@ -394,10 +394,10 @@ parse_sdvo_device_mapping(struct drm_psb_private *dev_priv,
>   			DRM_DEBUG_KMS("Maybe one SDVO port is shared by "
>   					 "two SDVO device.\n");
>   		}
> -		if (p_child->slave2_addr) {
> +		if (p_child->target2_addr) {
>   			/* Maybe this is a SDVO device with multiple inputs */
>   			/* And the mapping info is not added */
> -			DRM_DEBUG_KMS("there exists the slave2_addr. Maybe this"
> +			DRM_DEBUG_KMS("there exists the target2_addr. Maybe this"
>   				" is a SDVO device with multiple inputs.\n");
>   		}
>   		count++;
> diff --git a/drivers/gpu/drm/gma500/intel_bios.h b/drivers/gpu/drm/gma500/intel_bios.h
> index 0e6facf21e332..b5adea2a20c38 100644
> --- a/drivers/gpu/drm/gma500/intel_bios.h
> +++ b/drivers/gpu/drm/gma500/intel_bios.h
> @@ -186,13 +186,13 @@ struct child_device_config {
>   	u16 addin_offset;
>   	u8  dvo_port; /* See Device_PORT_* above */
>   	u8  i2c_pin;
> -	u8  slave_addr;
> +	u8  target_addr;
>   	u8  ddc_pin;
>   	u16 edid_ptr;
>   	u8  dvo_cfg; /* See DEVICE_CFG_* above */
>   	u8  dvo2_port;
>   	u8  i2c2_pin;
> -	u8  slave2_addr;
> +	u8  target2_addr;
>   	u8  ddc2_pin;
>   	u8  capabilities;
>   	u8  dvo_wiring;/* See DEVICE_WIRE_* above */
> diff --git a/drivers/gpu/drm/gma500/intel_gmbus.c b/drivers/gpu/drm/gma500/intel_gmbus.c
> index aa45509859f21..ee8b047587f25 100644
> --- a/drivers/gpu/drm/gma500/intel_gmbus.c
> +++ b/drivers/gpu/drm/gma500/intel_gmbus.c
> @@ -333,7 +333,7 @@ gmbus_xfer(struct i2c_adapter *adapter,
>   clear_err:
>   	/* Toggle the Software Clear Interrupt bit. This has the effect
>   	 * of resetting the GMBUS controller and so clearing the
> -	 * BUS_ERROR raised by the slave's NAK.
> +	 * BUS_ERROR raised by the target's NAK.
>   	 */
>   	GMBUS_REG_WRITE(GMBUS1 + reg_offset, GMBUS_SW_CLR_INT);
>   	GMBUS_REG_WRITE(GMBUS1 + reg_offset, 0);
> diff --git a/drivers/gpu/drm/gma500/psb_drv.h b/drivers/gpu/drm/gma500/psb_drv.h
> index 83c17689c454f..bddf89b82fecc 100644
> --- a/drivers/gpu/drm/gma500/psb_drv.h
> +++ b/drivers/gpu/drm/gma500/psb_drv.h
> @@ -202,7 +202,7 @@ struct psb_intel_opregion {
>   struct sdvo_device_mapping {
>   	u8 initialized;
>   	u8 dvo_port;
> -	u8 slave_addr;
> +	u8 target_addr;
>   	u8 dvo_wiring;
>   	u8 i2c_pin;
>   	u8 i2c_speed;
> diff --git a/drivers/gpu/drm/gma500/psb_intel_drv.h b/drivers/gpu/drm/gma500/psb_intel_drv.h
> index c111e933e1ed2..2499fd6a80c9d 100644
> --- a/drivers/gpu/drm/gma500/psb_intel_drv.h
> +++ b/drivers/gpu/drm/gma500/psb_intel_drv.h
> @@ -80,7 +80,7 @@ struct psb_intel_mode_device {
>   struct gma_i2c_chan {
>   	struct i2c_adapter base;
>   	struct i2c_algo_bit_data algo;
> -	u8 slave_addr;
> +	u8 target_addr;
>   
>   	/* for getting at dev. private (mmio etc.) */
>   	struct drm_device *drm_dev;
> diff --git a/drivers/gpu/drm/gma500/psb_intel_lvds.c b/drivers/gpu/drm/gma500/psb_intel_lvds.c
> index 8486de230ec91..d1cd9a9403959 100644
> --- a/drivers/gpu/drm/gma500/psb_intel_lvds.c
> +++ b/drivers/gpu/drm/gma500/psb_intel_lvds.c
> @@ -97,7 +97,7 @@ static int psb_lvds_i2c_set_brightness(struct drm_device *dev,
>   
>   	struct i2c_msg msgs[] = {
>   		{
> -			.addr = lvds_i2c_bus->slave_addr,
> +			.addr = lvds_i2c_bus->target_addr,
>   			.flags = 0,
>   			.len = 2,
>   			.buf = out_buf,
> @@ -707,7 +707,7 @@ void psb_intel_lvds_init(struct drm_device *dev,
>   			dev->dev, "I2C bus registration failed.\n");
>   		goto err_encoder_cleanup;
>   	}
> -	lvds_priv->i2c_bus->slave_addr = 0x2C;
> +	lvds_priv->i2c_bus->target_addr = 0x2C;
>   	dev_priv->lvds_i2c_bus =  lvds_priv->i2c_bus;
>   
>   	/*
> diff --git a/drivers/gpu/drm/gma500/psb_intel_sdvo.c b/drivers/gpu/drm/gma500/psb_intel_sdvo.c
> index e4f914decebae..8dafff963ca8b 100644
> --- a/drivers/gpu/drm/gma500/psb_intel_sdvo.c
> +++ b/drivers/gpu/drm/gma500/psb_intel_sdvo.c
> @@ -70,7 +70,7 @@ struct psb_intel_sdvo {
>   	struct gma_encoder base;
>   
>   	struct i2c_adapter *i2c;
> -	u8 slave_addr;
> +	u8 target_addr;
>   
>   	struct i2c_adapter ddc;
>   
> @@ -259,13 +259,13 @@ static bool psb_intel_sdvo_read_byte(struct psb_intel_sdvo *psb_intel_sdvo, u8 a
>   {
>   	struct i2c_msg msgs[] = {
>   		{
> -			.addr = psb_intel_sdvo->slave_addr,
> +			.addr = psb_intel_sdvo->target_addr,
>   			.flags = 0,
>   			.len = 1,
>   			.buf = &addr,
>   		},
>   		{
> -			.addr = psb_intel_sdvo->slave_addr,
> +			.addr = psb_intel_sdvo->target_addr,
>   			.flags = I2C_M_RD,
>   			.len = 1,
>   			.buf = ch,
> @@ -463,14 +463,14 @@ static bool psb_intel_sdvo_write_cmd(struct psb_intel_sdvo *psb_intel_sdvo, u8 c
>   	psb_intel_sdvo_debug_write(psb_intel_sdvo, cmd, args, args_len);
>   
>   	for (i = 0; i < args_len; i++) {
> -		msgs[i].addr = psb_intel_sdvo->slave_addr;
> +		msgs[i].addr = psb_intel_sdvo->target_addr;
>   		msgs[i].flags = 0;
>   		msgs[i].len = 2;
>   		msgs[i].buf = buf + 2 *i;
>   		buf[2*i + 0] = SDVO_I2C_ARG_0 - i;
>   		buf[2*i + 1] = ((u8*)args)[i];
>   	}
> -	msgs[i].addr = psb_intel_sdvo->slave_addr;
> +	msgs[i].addr = psb_intel_sdvo->target_addr;
>   	msgs[i].flags = 0;
>   	msgs[i].len = 2;
>   	msgs[i].buf = buf + 2*i;
> @@ -479,12 +479,12 @@ static bool psb_intel_sdvo_write_cmd(struct psb_intel_sdvo *psb_intel_sdvo, u8 c
>   
>   	/* the following two are to read the response */
>   	status = SDVO_I2C_CMD_STATUS;
> -	msgs[i+1].addr = psb_intel_sdvo->slave_addr;
> +	msgs[i+1].addr = psb_intel_sdvo->target_addr;
>   	msgs[i+1].flags = 0;
>   	msgs[i+1].len = 1;
>   	msgs[i+1].buf = &status;
>   
> -	msgs[i+2].addr = psb_intel_sdvo->slave_addr;
> +	msgs[i+2].addr = psb_intel_sdvo->target_addr;
>   	msgs[i+2].flags = I2C_M_RD;
>   	msgs[i+2].len = 1;
>   	msgs[i+2].buf = &status;
> @@ -1899,7 +1899,7 @@ psb_intel_sdvo_is_hdmi_connector(struct psb_intel_sdvo *psb_intel_sdvo, int devi
>   }
>   
>   static u8
> -psb_intel_sdvo_get_slave_addr(struct drm_device *dev, int sdvo_reg)
> +psb_intel_sdvo_get_target_addr(struct drm_device *dev, int sdvo_reg)
>   {
>   	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
>   	struct sdvo_device_mapping *my_mapping, *other_mapping;
> @@ -1913,14 +1913,14 @@ psb_intel_sdvo_get_slave_addr(struct drm_device *dev, int sdvo_reg)
>   	}
>   
>   	/* If the BIOS described our SDVO device, take advantage of it. */
> -	if (my_mapping->slave_addr)
> -		return my_mapping->slave_addr;
> +	if (my_mapping->target_addr)
> +		return my_mapping->target_addr;
>   
>   	/* If the BIOS only described a different SDVO device, use the
>   	 * address that it isn't using.
>   	 */
> -	if (other_mapping->slave_addr) {
> -		if (other_mapping->slave_addr == 0x70)
> +	if (other_mapping->target_addr) {
> +		if (other_mapping->target_addr == 0x70)
>   			return 0x72;
>   		else
>   			return 0x70;
> @@ -2446,7 +2446,7 @@ bool psb_intel_sdvo_init(struct drm_device *dev, int sdvo_reg)
>   		return false;
>   
>   	psb_intel_sdvo->sdvo_reg = sdvo_reg;
> -	psb_intel_sdvo->slave_addr = psb_intel_sdvo_get_slave_addr(dev, sdvo_reg) >> 1;
> +	psb_intel_sdvo->target_addr = psb_intel_sdvo_get_target_addr(dev, sdvo_reg) >> 1;
>   	psb_intel_sdvo_select_i2c_bus(dev_priv, psb_intel_sdvo, sdvo_reg);
>   	if (!psb_intel_sdvo_init_ddc_proxy(psb_intel_sdvo, dev)) {
>   		kfree(psb_intel_sdvo);

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


