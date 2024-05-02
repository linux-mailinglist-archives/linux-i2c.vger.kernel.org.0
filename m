Return-Path: <linux-i2c+bounces-3370-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8521A8B9968
	for <lists+linux-i2c@lfdr.de>; Thu,  2 May 2024 12:47:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 01FD21F2494E
	for <lists+linux-i2c@lfdr.de>; Thu,  2 May 2024 10:47:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 393D15FEF2;
	Thu,  2 May 2024 10:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EcpiCXhP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5G7GFDoC";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EcpiCXhP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5G7GFDoC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4FB35D903;
	Thu,  2 May 2024 10:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714646770; cv=none; b=O+bPw5tmmK47WwxE0r3H5qhbevqgQLbg1TtFOGJMpislnfnCb8UNV/+zhWGLGULJUFWWhsRLShrS3pGWLvlCv3rkjxuY2T+KHIavo9eii4BsnGlCjduvrP9dt+w3LWCMkgW7mkAQUOo6LnrpszWm+C8tSGS/soXmkJMEqb2e1bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714646770; c=relaxed/simple;
	bh=u3YBowyQIANHMcTK7kxk0HNHLL5iznKNxq9nzrT0K48=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sInHys0uH/CDhkBzl8i1eD6iSkAwrqXZUyhnNjRaMZgY2ksDevvtHSt3m6OIOuzNKX3/Me9q1gFsGTwTQKQ0gcA2ondYlMduAgTOzHfODLwmJkyK1CEWTZCkqOTbUtUBBJXjXQyrvxTng8QfuYTxLpzVYVSlmKRDKHTAudOTdQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=EcpiCXhP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5G7GFDoC; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=EcpiCXhP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5G7GFDoC; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 080261FBF9;
	Thu,  2 May 2024 10:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1714646766; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=zrXOa0VVlZDvgwP96iZpHXIU4P3xQQOxjymEw8QiRWI=;
	b=EcpiCXhPUIhb0RMHJ4fGpeieAw2MIHoEgzD+S6scRJ8JnFf+qjmqDV7vnUZV430ZxbgnAU
	9ykV8DOJl9wwBV4BC1+MQrE96FtFArDpm+l67OiYAK6dkb5y60K1lT5DxHS5qMMHdvyNcA
	5Mb/GKZQAJW8oZWunuK6IIEQOsm6ccI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1714646766;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=zrXOa0VVlZDvgwP96iZpHXIU4P3xQQOxjymEw8QiRWI=;
	b=5G7GFDoCXtGPCKcTVXHf4u4b11gWpVq9y7l1On/+0MNaHZHn6/8d/TWtssHqI6x9PxuRPk
	+8qoNrIAQn6cQIBw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=EcpiCXhP;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=5G7GFDoC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1714646766; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=zrXOa0VVlZDvgwP96iZpHXIU4P3xQQOxjymEw8QiRWI=;
	b=EcpiCXhPUIhb0RMHJ4fGpeieAw2MIHoEgzD+S6scRJ8JnFf+qjmqDV7vnUZV430ZxbgnAU
	9ykV8DOJl9wwBV4BC1+MQrE96FtFArDpm+l67OiYAK6dkb5y60K1lT5DxHS5qMMHdvyNcA
	5Mb/GKZQAJW8oZWunuK6IIEQOsm6ccI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1714646766;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=zrXOa0VVlZDvgwP96iZpHXIU4P3xQQOxjymEw8QiRWI=;
	b=5G7GFDoCXtGPCKcTVXHf4u4b11gWpVq9y7l1On/+0MNaHZHn6/8d/TWtssHqI6x9PxuRPk
	+8qoNrIAQn6cQIBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 976F81386E;
	Thu,  2 May 2024 10:46:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MAAXI+1uM2aNFgAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 02 May 2024 10:46:05 +0000
Message-ID: <271ad513-0ea1-45df-ba0f-51582474ff34@suse.de>
Date: Thu, 2 May 2024 12:46:05 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 12/12] fbdev/viafb: Make I2C terminology more inclusive
To: Easwar Hariharan <eahariha@linux.microsoft.com>,
 Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
 Helge Deller <deller@gmx.de>,
 "open list:VIA UNICHROME(PRO)/CHROME9 FRAMEBUFFER DRIVER"
 <linux-fbdev@vger.kernel.org>,
 "open list:FRAMEBUFFER LAYER" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS"
 <intel-gfx@lists.freedesktop.org>,
 "open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS"
 <intel-xe@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>,
 "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
 "open list:BTTV VIDEO4LINUX DRIVER" <linux-media@vger.kernel.org>
References: <20240430173812.1423757-1-eahariha@linux.microsoft.com>
 <20240430173812.1423757-13-eahariha@linux.microsoft.com>
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
In-Reply-To: <20240430173812.1423757-13-eahariha@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Flag: NO
X-Spam-Score: -5.00
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 080261FBF9
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-5.00 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	MX_GOOD(-0.01)[];
	FREEMAIL_TO(0.00)[linux.microsoft.com,gmx.de,vger.kernel.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmx.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[renesas];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email]



Am 30.04.24 um 19:38 schrieb Easwar Hariharan:
> I2C v7, SMBus 3.2, and I3C 1.1.1 specifications have replaced "master/slave"
> with more appropriate terms. Inspired by and following on to Wolfram's
> series to fix drivers/i2c/[1], fix the terminology for users of
> I2C_ALGOBIT bitbanging interface, now that the approved verbiage exists
> in the specification.
>
> Compile tested, no functionality changes intended
>
> [1]: https://lore.kernel.org/all/20240322132619.6389-1-wsa+renesas@sang-engineering.com/
>
> Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   drivers/video/fbdev/via/chip.h    |  8 ++++----
>   drivers/video/fbdev/via/dvi.c     | 24 ++++++++++++------------
>   drivers/video/fbdev/via/lcd.c     |  6 +++---
>   drivers/video/fbdev/via/via_aux.h |  2 +-
>   drivers/video/fbdev/via/via_i2c.c | 12 ++++++------
>   drivers/video/fbdev/via/vt1636.c  |  6 +++---
>   6 files changed, 29 insertions(+), 29 deletions(-)
>
> diff --git a/drivers/video/fbdev/via/chip.h b/drivers/video/fbdev/via/chip.h
> index f0a19cbcb9e5..1ea6d4ce79e7 100644
> --- a/drivers/video/fbdev/via/chip.h
> +++ b/drivers/video/fbdev/via/chip.h
> @@ -69,7 +69,7 @@
>   #define     VT1632_TMDS             0x01
>   #define     INTEGRATED_TMDS         0x42
>   
> -/* Definition TMDS Trasmitter I2C Slave Address */
> +/* Definition TMDS Trasmitter I2C Client Address */
>   #define     VT1632_TMDS_I2C_ADDR    0x10
>   
>   /**************************************************/
> @@ -88,21 +88,21 @@
>   #define     TX_DATA_DDR_MODE        0x04
>   #define     TX_DATA_SDR_MODE        0x08
>   
> -/* Definition LVDS Trasmitter I2C Slave Address */
> +/* Definition LVDS Trasmitter I2C Client Address */
>   #define     VT1631_LVDS_I2C_ADDR    0x70
>   #define     VT3271_LVDS_I2C_ADDR    0x80
>   #define     VT1636_LVDS_I2C_ADDR    0x80
>   
>   struct tmds_chip_information {
>   	int tmds_chip_name;
> -	int tmds_chip_slave_addr;
> +	int tmds_chip_client_addr;
>   	int output_interface;
>   	int i2c_port;
>   };
>   
>   struct lvds_chip_information {
>   	int lvds_chip_name;
> -	int lvds_chip_slave_addr;
> +	int lvds_chip_client_addr;
>   	int output_interface;
>   	int i2c_port;
>   };
> diff --git a/drivers/video/fbdev/via/dvi.c b/drivers/video/fbdev/via/dvi.c
> index 13147e3066eb..db7db26416c3 100644
> --- a/drivers/video/fbdev/via/dvi.c
> +++ b/drivers/video/fbdev/via/dvi.c
> @@ -70,7 +70,7 @@ bool viafb_tmds_trasmitter_identify(void)
>   	/* Check for VT1632: */
>   	viaparinfo->chip_info->tmds_chip_info.tmds_chip_name = VT1632_TMDS;
>   	viaparinfo->chip_info->
> -		tmds_chip_info.tmds_chip_slave_addr = VT1632_TMDS_I2C_ADDR;
> +		tmds_chip_info.tmds_chip_client_addr = VT1632_TMDS_I2C_ADDR;
>   	viaparinfo->chip_info->tmds_chip_info.i2c_port = VIA_PORT_31;
>   	if (check_tmds_chip(VT1632_DEVICE_ID_REG, VT1632_DEVICE_ID)) {
>   		/*
> @@ -128,14 +128,14 @@ bool viafb_tmds_trasmitter_identify(void)
>   	viaparinfo->chip_info->
>   		tmds_chip_info.tmds_chip_name = NON_TMDS_TRANSMITTER;
>   	viaparinfo->chip_info->tmds_chip_info.
> -		tmds_chip_slave_addr = VT1632_TMDS_I2C_ADDR;
> +		tmds_chip_client_addr = VT1632_TMDS_I2C_ADDR;
>   	return false;
>   }
>   
>   static void tmds_register_write(int index, u8 data)
>   {
>   	viafb_i2c_writebyte(viaparinfo->chip_info->tmds_chip_info.i2c_port,
> -			    viaparinfo->chip_info->tmds_chip_info.tmds_chip_slave_addr,
> +			    viaparinfo->chip_info->tmds_chip_info.tmds_chip_client_addr,
>   			    index, data);
>   }
>   
> @@ -144,7 +144,7 @@ static int tmds_register_read(int index)
>   	u8 data;
>   
>   	viafb_i2c_readbyte(viaparinfo->chip_info->tmds_chip_info.i2c_port,
> -			   (u8) viaparinfo->chip_info->tmds_chip_info.tmds_chip_slave_addr,
> +			   (u8) viaparinfo->chip_info->tmds_chip_info.tmds_chip_client_addr,
>   			   (u8) index, &data);
>   	return data;
>   }
> @@ -152,7 +152,7 @@ static int tmds_register_read(int index)
>   static int tmds_register_read_bytes(int index, u8 *buff, int buff_len)
>   {
>   	viafb_i2c_readbytes(viaparinfo->chip_info->tmds_chip_info.i2c_port,
> -			    (u8) viaparinfo->chip_info->tmds_chip_info.tmds_chip_slave_addr,
> +			    (u8) viaparinfo->chip_info->tmds_chip_info.tmds_chip_client_addr,
>   			    (u8) index, buff, buff_len);
>   	return 0;
>   }
> @@ -256,14 +256,14 @@ static int viafb_dvi_query_EDID(void)
>   
>   	DEBUG_MSG(KERN_INFO "viafb_dvi_query_EDID!!\n");
>   
> -	restore = viaparinfo->chip_info->tmds_chip_info.tmds_chip_slave_addr;
> -	viaparinfo->chip_info->tmds_chip_info.tmds_chip_slave_addr = 0xA0;
> +	restore = viaparinfo->chip_info->tmds_chip_info.tmds_chip_client_addr;
> +	viaparinfo->chip_info->tmds_chip_info.tmds_chip_client_addr = 0xA0;
>   
>   	data0 = (u8) tmds_register_read(0x00);
>   	data1 = (u8) tmds_register_read(0x01);
>   	if ((data0 == 0) && (data1 == 0xFF)) {
>   		viaparinfo->chip_info->
> -			tmds_chip_info.tmds_chip_slave_addr = restore;
> +			tmds_chip_info.tmds_chip_client_addr = restore;
>   		return EDID_VERSION_1;	/* Found EDID1 Table */
>   	}
>   
> @@ -280,8 +280,8 @@ static void dvi_get_panel_size_from_DDCv1(
>   
>   	DEBUG_MSG(KERN_INFO "\n dvi_get_panel_size_from_DDCv1 \n");
>   
> -	restore = tmds_chip->tmds_chip_slave_addr;
> -	tmds_chip->tmds_chip_slave_addr = 0xA0;
> +	restore = tmds_chip->tmds_chip_client_addr;
> +	tmds_chip->tmds_chip_client_addr = 0xA0;
>   	for (i = 0x25; i < 0x6D; i++) {
>   		switch (i) {
>   		case 0x36:
> @@ -306,7 +306,7 @@ static void dvi_get_panel_size_from_DDCv1(
>   
>   	DEBUG_MSG(KERN_INFO "DVI max pixelclock = %d\n",
>   		tmds_setting->max_pixel_clock);
> -	tmds_chip->tmds_chip_slave_addr = restore;
> +	tmds_chip->tmds_chip_client_addr = restore;
>   }
>   
>   /* If Disable DVI, turn off pad */
> @@ -427,7 +427,7 @@ void viafb_dvi_enable(void)
>   				viafb_i2c_writebyte(viaparinfo->chip_info->
>   					tmds_chip_info.i2c_port,
>   					viaparinfo->chip_info->
> -					tmds_chip_info.tmds_chip_slave_addr,
> +					tmds_chip_info.tmds_chip_client_addr,
>   					0x08, data);
>   			}
>   		}
> diff --git a/drivers/video/fbdev/via/lcd.c b/drivers/video/fbdev/via/lcd.c
> index beec5c8d4d08..9a6e4ac9e551 100644
> --- a/drivers/video/fbdev/via/lcd.c
> +++ b/drivers/video/fbdev/via/lcd.c
> @@ -147,7 +147,7 @@ bool viafb_lvds_trasmitter_identify(void)
>   		return true;
>   	/* Check for VT1631: */
>   	viaparinfo->chip_info->lvds_chip_info.lvds_chip_name = VT1631_LVDS;
> -	viaparinfo->chip_info->lvds_chip_info.lvds_chip_slave_addr =
> +	viaparinfo->chip_info->lvds_chip_info.lvds_chip_client_addr =
>   		VT1631_LVDS_I2C_ADDR;
>   
>   	if (check_lvds_chip(VT1631_DEVICE_ID_REG, VT1631_DEVICE_ID)) {
> @@ -161,7 +161,7 @@ bool viafb_lvds_trasmitter_identify(void)
>   
>   	viaparinfo->chip_info->lvds_chip_info.lvds_chip_name =
>   		NON_LVDS_TRANSMITTER;
> -	viaparinfo->chip_info->lvds_chip_info.lvds_chip_slave_addr =
> +	viaparinfo->chip_info->lvds_chip_info.lvds_chip_client_addr =
>   		VT1631_LVDS_I2C_ADDR;
>   	return false;
>   }
> @@ -327,7 +327,7 @@ static int lvds_register_read(int index)
>   	u8 data;
>   
>   	viafb_i2c_readbyte(VIA_PORT_2C,
> -			(u8) viaparinfo->chip_info->lvds_chip_info.lvds_chip_slave_addr,
> +			(u8) viaparinfo->chip_info->lvds_chip_info.lvds_chip_client_addr,
>   			(u8) index, &data);
>   	return data;
>   }
> diff --git a/drivers/video/fbdev/via/via_aux.h b/drivers/video/fbdev/via/via_aux.h
> index 0933bbf20e58..e2b617b1e6fd 100644
> --- a/drivers/video/fbdev/via/via_aux.h
> +++ b/drivers/video/fbdev/via/via_aux.h
> @@ -24,7 +24,7 @@ struct via_aux_drv {
>   	struct list_head chain;		/* chain to support multiple drivers */
>   
>   	struct via_aux_bus *bus;	/* the I2C bus used */
> -	u8 addr;			/* the I2C slave address */
> +	u8 addr;			/* the I2C client address */
>   
>   	const char *name;	/* human readable name of the driver */
>   	void *data;		/* private data of this driver */
> diff --git a/drivers/video/fbdev/via/via_i2c.c b/drivers/video/fbdev/via/via_i2c.c
> index 582502810575..907c739475d0 100644
> --- a/drivers/video/fbdev/via/via_i2c.c
> +++ b/drivers/video/fbdev/via/via_i2c.c
> @@ -104,7 +104,7 @@ static void via_i2c_setsda(void *data, int state)
>   	spin_unlock_irqrestore(&i2c_vdev->reg_lock, flags);
>   }
>   
> -int viafb_i2c_readbyte(u8 adap, u8 slave_addr, u8 index, u8 *pdata)
> +int viafb_i2c_readbyte(u8 adap, u8 client_addr, u8 index, u8 *pdata)
>   {
>   	int ret;
>   	u8 mm1[] = {0x00};
> @@ -115,7 +115,7 @@ int viafb_i2c_readbyte(u8 adap, u8 slave_addr, u8 index, u8 *pdata)
>   	*pdata = 0;
>   	msgs[0].flags = 0;
>   	msgs[1].flags = I2C_M_RD;
> -	msgs[0].addr = msgs[1].addr = slave_addr / 2;
> +	msgs[0].addr = msgs[1].addr = client_addr / 2;
>   	mm1[0] = index;
>   	msgs[0].len = 1; msgs[1].len = 1;
>   	msgs[0].buf = mm1; msgs[1].buf = pdata;
> @@ -128,7 +128,7 @@ int viafb_i2c_readbyte(u8 adap, u8 slave_addr, u8 index, u8 *pdata)
>   	return ret;
>   }
>   
> -int viafb_i2c_writebyte(u8 adap, u8 slave_addr, u8 index, u8 data)
> +int viafb_i2c_writebyte(u8 adap, u8 client_addr, u8 index, u8 data)
>   {
>   	int ret;
>   	u8 msg[2] = { index, data };
> @@ -137,7 +137,7 @@ int viafb_i2c_writebyte(u8 adap, u8 slave_addr, u8 index, u8 data)
>   	if (!via_i2c_par[adap].is_active)
>   		return -ENODEV;
>   	msgs.flags = 0;
> -	msgs.addr = slave_addr / 2;
> +	msgs.addr = client_addr / 2;
>   	msgs.len = 2;
>   	msgs.buf = msg;
>   	ret = i2c_transfer(&via_i2c_par[adap].adapter, &msgs, 1);
> @@ -149,7 +149,7 @@ int viafb_i2c_writebyte(u8 adap, u8 slave_addr, u8 index, u8 data)
>   	return ret;
>   }
>   
> -int viafb_i2c_readbytes(u8 adap, u8 slave_addr, u8 index, u8 *buff, int buff_len)
> +int viafb_i2c_readbytes(u8 adap, u8 client_addr, u8 index, u8 *buff, int buff_len)
>   {
>   	int ret;
>   	u8 mm1[] = {0x00};
> @@ -159,7 +159,7 @@ int viafb_i2c_readbytes(u8 adap, u8 slave_addr, u8 index, u8 *buff, int buff_len
>   		return -ENODEV;
>   	msgs[0].flags = 0;
>   	msgs[1].flags = I2C_M_RD;
> -	msgs[0].addr = msgs[1].addr = slave_addr / 2;
> +	msgs[0].addr = msgs[1].addr = client_addr / 2;
>   	mm1[0] = index;
>   	msgs[0].len = 1; msgs[1].len = buff_len;
>   	msgs[0].buf = mm1; msgs[1].buf = buff;
> diff --git a/drivers/video/fbdev/via/vt1636.c b/drivers/video/fbdev/via/vt1636.c
> index 8d8cfdb05618..614e5c29a449 100644
> --- a/drivers/video/fbdev/via/vt1636.c
> +++ b/drivers/video/fbdev/via/vt1636.c
> @@ -44,7 +44,7 @@ u8 viafb_gpio_i2c_read_lvds(struct lvds_setting_information
>   	u8 data;
>   
>   	viafb_i2c_readbyte(plvds_chip_info->i2c_port,
> -			   plvds_chip_info->lvds_chip_slave_addr, index, &data);
> +			   plvds_chip_info->lvds_chip_client_addr, index, &data);
>   	return data;
>   }
>   
> @@ -60,7 +60,7 @@ void viafb_gpio_i2c_write_mask_lvds(struct lvds_setting_information
>   	data = (data & (~io_data.Mask)) | io_data.Data;
>   
>   	viafb_i2c_writebyte(plvds_chip_info->i2c_port,
> -			    plvds_chip_info->lvds_chip_slave_addr, index, data);
> +			    plvds_chip_info->lvds_chip_client_addr, index, data);
>   }
>   
>   void viafb_init_lvds_vt1636(struct lvds_setting_information
> @@ -113,7 +113,7 @@ bool viafb_lvds_identify_vt1636(u8 i2c_adapter)
>   	DEBUG_MSG(KERN_INFO "viafb_lvds_identify_vt1636.\n");
>   
>   	/* Sense VT1636 LVDS Transmiter */
> -	viaparinfo->chip_info->lvds_chip_info.lvds_chip_slave_addr =
> +	viaparinfo->chip_info->lvds_chip_info.lvds_chip_client_addr =
>   		VT1636_LVDS_I2C_ADDR;
>   
>   	/* Check vendor ID first: */

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


