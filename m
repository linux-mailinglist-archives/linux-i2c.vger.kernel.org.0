Return-Path: <linux-i2c+bounces-15222-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4DFD2F4DC
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Jan 2026 11:10:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1C508301C82F
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Jan 2026 10:09:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 009F135EDC6;
	Fri, 16 Jan 2026 10:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="pHPDhk4N"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DECA35F8B4
	for <linux-i2c@vger.kernel.org>; Fri, 16 Jan 2026 10:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768558165; cv=none; b=lH2ZTfMAGY/LtF5TvpQCIdz8hIutRWI2GhleIN3urY72ZmVlu2x+zTLzFC6rxBXA2iGR1lwmrH/VyIhLrIj6bFcTWebWaMQj/J13B0aR6J4nr1ursSwLRsAa9op1LeqYprcq1+2lsxhNhD7iDEQhX/13XUyH25CkZIpv2x+RhJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768558165; c=relaxed/simple;
	bh=nhfnEdkw0ELp9o79AEQfYI9EAI9CG92t7Sf0wpy/TxM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Mb1wcYpCCxs2TSV7DwPMjHoceSMmHtNUMB/P3Qcnm0MZcmeI5G45+G6hBSaRhFd0YxnokgkDm2nyuGcTTZUSvwBlrQ8f2cvSetJ4y46zeH78vrzx9xYicLDFnMJ8z8G7JM32TnSxec6VIKdGvSxTsyWQmxzYKFqTQ6WydvkqY2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=pHPDhk4N; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-64b8123c333so2925105a12.3
        for <linux-i2c@vger.kernel.org>; Fri, 16 Jan 2026 02:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1768558161; x=1769162961; darn=vger.kernel.org;
        h=mime-version:user-agent:organization:references:in-reply-to:date:cc
         :to:from:subject:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nhfnEdkw0ELp9o79AEQfYI9EAI9CG92t7Sf0wpy/TxM=;
        b=pHPDhk4N7wxvyl+YjVuzwk6e43yj0B4wHxOaVUIuqSUAgNBwd52w+z2c27NZl9nwWj
         8hmlpzLUfz1bXpW/p1MhveBMA9ZT4kJdPJaJoqfhegednzRbhYHkEkDPj/CrL43+/1Cj
         PP/6VB6Sz4QW5wLzqsBKxmj5Y15Yxk4aH+Own9D2/v/Us/iTmGfJlh8pfnK/C1fsWInq
         jpbe0AQE4T3RvYeCOtDU/51Ovox431chU86mDhJ2eps4ExBvJYmLxjwXOhuCnHRQb3ie
         6AvurPo6643EmKBS+U8P0NUTlafJbNKu7nu3YJ9DYd4vwNwI+vsTzM5RJgAw0q6KRO2F
         z8PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768558161; x=1769162961;
        h=mime-version:user-agent:organization:references:in-reply-to:date:cc
         :to:from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nhfnEdkw0ELp9o79AEQfYI9EAI9CG92t7Sf0wpy/TxM=;
        b=wr6PpcTVtOVZeiXwU6moVzJ3HEr+ubYDdno1f7fK+6Jr+okFlHstKPTVLaRhC+emO5
         QPuww9/zX2JWY3n99ZJRAWF3UoH1sY6QiSUfN//zqEhmhZmEKXZ+d7IANOI1zpkEQl7B
         X6G8aiCLJFDcmXW7Lprtj/H3qWp9BN07PhnhNneGUkBTHXwE5Tfx/9Q83RtMUo0rvE69
         lZiUc2CaeQmMzB6Nh1HTQSiwU0mrvMKngMdst/4/sP/8RLANwS+QFVZnZWFprgX+ZQt2
         4+tgUhlWUrJCpw5Oou3s0a6fvxIysOIBO+Fa5pxeNOa6d8QyNYTuTffKNsnyDiqKVXu/
         sXhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUX2CBe5qhYP/fFYNfRnKbsLOPsOHAQ9pSSYJCRp9xYPvzVTteNOJvvlyoV0uNtH6EBWtMVk6HDA6o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQI+LyfzY9EMojBPw5j9mbZS+BBTSyGxYzfG10OzoBLA4kqxoe
	+WVa2UR5gMOx5lnS0h2PYtNfQhWI2bm+dirX0zeS1BnFJn2mfRxa2CTGz5HTnhkqRt4=
X-Gm-Gg: AY/fxX6rfQa+vG7ZbohGv9OWwxOtbP0s2jZuBqqDgdxEb2J6oShCI9BIAZXnArcwLHW
	c2a+zrUx4w2aH3a/uykwVMOiY5qXWS6LciQ45wcM07SjZ+Y0ZmEJh2b3dYKSqwKuvpuefazVf5K
	cuVeRWPqA3BTgIgzX8ppMqHIzimEJ5q7lxv2mz+D8NPoANYiqzDeHGvgfltYVhJKwQPZc+JCFlW
	ZpsrX0ogWqdd9aS3cZcDmoYA+pp1WrPawyB3NPg/oZGsoBWRbCwsGgM0I7wuGqb4uxwbWvkSba5
	ksVVaWdmW/am6W5om6vxZH3dsy1J2CmVpmDmm8AZ/o3mpALqTx9AMEfKtHyLGFb5rdUHxWVR/F0
	OjUV+mvPdz8J/Zbq+N2rdPvATTwbqGQI+1BtwmibAdnfUYIoL0vKFWNuo3uwNy46Rzk1z3ME=
X-Received: by 2002:a05:6402:2346:b0:649:9268:1f43 with SMTP id 4fb4d7f45d1cf-654bb32c88fmr1395171a12.21.1768558161296;
        Fri, 16 Jan 2026 02:09:21 -0800 (PST)
Received: from [10.203.83.158] ([151.57.145.112])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65452bce213sm1990999a12.2.2026.01.16.02.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 02:09:20 -0800 (PST)
Message-ID: <89ec96d9411faaa47ccf06f21d144132fa26ec4f.camel@baylibre.com>
Subject: Re: [PATCH] i2c: Add FTDI FT4222H USB I2C adapter
From: Francesco Lavra <flavra@baylibre.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Date: Fri, 16 Jan 2026 11:09:15 +0100
In-Reply-To: <aWjodd1Vm_pDIvif@zenone.zhora.eu>
References: <20260106170807.3964886-1-flavra@baylibre.com>
	 <aV5aM4OgIeJtsxlb@zenone.zhora.eu>
	 <a503fea8fdf4156526d473ee2208b42b896b50c1.camel@baylibre.com>
	 <aWjodd1Vm_pDIvif@zenone.zhora.eu>
Organization: BayLibre
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-LmyWZRNNHeFG/gmX0j3i"
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-LmyWZRNNHeFG/gmX0j3i
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

T24gVGh1LCAyMDI2LTAxLTE1IGF0IDE1OjIwICswMTAwLCBBbmRpIFNoeXRpIHdyb3RlOgo+ID4g
T24gV2VkLCAyMDI2LTAxLTA3IGF0IDE0OjM4ICswMTAwLCBBbmRpIFNoeXRpIHdyb3RlOgo+ID4g
PiBIaSBGcmFuY2VzY28sCj4gPiA+IAo+ID4gPiBJIGRpZCBqdXN0IGEgcXVpY2sgaW5pdGlhbCBy
ZXZpZXcuCj4gPiAKPiA+IC4uLgo+ID4gCj4gPiA+ID4gK3N0YXRpYyBpbnQgZnQ0MjIyX2kyY19n
ZXRfc3RhdHVzKHN0cnVjdCBmdDQyMjJfaTJjICpmdGRpKQo+ID4gPiA+ICt7Cj4gPiA+ID4gK8Kg
wqDCoMKgwqDCoMKgdTggc3RhdHVzOwo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoGludCByZXRyeTsK
PiA+ID4gPiArwqDCoMKgwqDCoMKgwqBjb25zdCBpbnQgbWF4X3JldHJpZXMgPSA1MTI7Cj4gPiA+
IAo+ID4gPiB3aHkgNTEyPwo+ID4gCj4gPiBUaGVzZSByZXRyaWVzIGFyZSBuZWVkZWQgbW9zdGx5
IHdoZW4gcmV0cmlldmluZyB0aGUgc3RhdHVzIGFmdGVyIGRvaW5nCj4gPiBhCj4gPiB3cml0ZSB3
aXRoIHRoZSBJMkMgYnVzIG9wZXJhdGluZyBhdCBhIGxvdyBzcGVlZC4KPiA+IERvaW5nIHZhcmlv
dXMgdGVzdHMgYXQgMTAwIGtIeiwgSSBzYXcgdGhhdCBhZnRlciBhIG1heGltdW0tc2l6ZWQgKDUx
Mi0KPiA+IGJ5dGUpCj4gPiB3cml0ZSwgdXAgdG8gMTEgcmV0cmllcyBhcmUgbmVlZGVkIGJlZm9y
ZSB0aGUgY2hpcCBjbGVhcnMgaXRzIENUUkxfQlVTWQo+ID4gZmxhZy4gQnV0IHVuZGVyIGNlcnRh
aW4gY29uZGl0aW9ucyB3ZSBtYXkgbmVlZCBtb3JlIHJldHJpZXMsIGZvcgo+ID4gZXhhbXBsZSBp
Zgo+ID4gSSBkaXNjb25uZWN0IHRoZSBTQ0wgbGluZSBhbmQgdGhlbiB0cnkgdG8gZG8gYSB3cml0
ZSwgSSBzZWUgdGhhdCB1cCB0bwo+ID4gNjQKPiA+IHJldHJpZXMgYXJlIG5lZWRlZC4KPiA+IFNv
IEkgZ3Vlc3MgNTEyIG1heF9yZXRyaWVzIGlzIHRvbyBtdWNoLCBidXQgd2UgbmVlZCBhIHZhbHVl
ID4gNjQuIERvZXMKPiA+IDEyOAo+ID4gc291bmQgT0sgdG8geW91PyBQZXJoYXBzIEkgY2FuIGFk
ZCBhIGNvbW1lbnQgd2l0aCB0aGUgYWJvdmUKPiA+IG9ic2VydmF0aW9ucy4KPiAKPiBBbGwgY29u
c3RhbnRzIG5lZWQgdG8gaGF2ZSBhIGNvbW1lbnQgb3IgZGVmaW5lZCBvciBib3RoLiBBIGdvb2QK
PiBjb21tZW50IHdvdWxkIGRlZmluaXRlbHkgaGVscC4gQXMgZm9yIHRoZSBudW1iZXIgb2YgcmV0
cmllcyBpdAo+IGxvb2tzIGEgYml0IHRvbyBtdWNoIHRvIG1lLCBidXQgeW91IGRlZmluaXRlbHkg
a25vdyBiZXR0ZXIuCgpPSywgSSBhZGRlZCBhIGNvbW1lbnQgYW5kIGNoYW5nZWQgdGhlIGNvbnN0
YW50IHRvIDcwLgoKPiA+ID4gPiArwqDCoMKgwqDCoMKgwqBmb3IgKHJldHJ5ID0gMDsgcmV0cnkg
PCBtYXhfcmV0cmllczsgcmV0cnkrKykgewo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqBpbnQgcmV0ID0gZnQ0MjIyX2NtZF9nZXQoZnRkaSwgMHhmNWI0LCAmc3RhdHVzKTsK
PiA+ID4gPiArCj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmIChyZXQg
PCAwKQo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgcmV0dXJuIHJldDsKPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYg
KCEoc3RhdHVzICYgRlQ0MjIyX0kyQ19DVFJMX0JVU1kpKQo+ID4gPiA+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgYnJlYWs7Cj4gPiA+ID4gK8KgwqDCoMKg
wqDCoMKgfQo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoGRldl9kYmcoJmZ0ZGktPmFkYXB0ZXIuZGV2
LCAic3RhdHVzIDB4JTAyeCAoJWQgcmV0cmllcykiLAo+ID4gPiA+IHN0YXR1cywKPiA+ID4gPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0cnkpOwo+ID4gPiAKPiA+ID4gd2hvdWxk
IHRoaXMgZGVidWcgbWVzc2FnZSBiZSBwcmludGVkIGFmdGVyIHRoZSBjaGVjayBiZWxvdz8KPiA+
IAo+ID4gTm90IHN1cmUgSSB1bmRlcnN0b29kIHlvdXIgcXVlc3Rpb24uIEFyZSB5b3Ugc3VnZ2Vz
dGluZyB0byBtb3ZlIHRoZQo+ID4gZGV2X2RiZygpIGNhbGwgYWZ0ZXIgdGhlIGNoZWNrIGJlbG93
PyBJIHB1dCBpdCBiZWZvcmUgdGhlIGNoZWNrIHNvIHRoYXQKPiA+IEkKPiA+IGdldCBhIGRlYnVn
IG1lc3NhZ2UgZXZlbiBpZiB0aGUgbWF4aW11bSBudW1iZXIgb2YgcmV0cmllcyBoYXMgYmVlbgo+
ID4gcmVhY2hlZC4KPiAKPiBJdCBsb29rcyB0byBtZSBtb3JlIGxpa2UgYSBzcGFtIG1lc3NhZ2Ug
b3IgYSBzcHVyaW91cyBwcmludG91dAo+IGFmdGVyIGEgZGVidWdnaW5nIHNlc3Npb24sIHJhdGhl
ciB0aGFuIGFuIGluZm9ybWF0aXZlIG1lc3NhZ2UuCj4gCj4gSSdkIHJlbW92ZSBpdCwgYnV0IGlm
IHlvdSB0aGluayB0aGF0J3MgcmVhbGx5IHVzZWZ1bCwgdGhlbiB5b3UKPiBjYW4ga2VlcCBpdC4K
ClJlbW92ZWQuCgoKPiA+ID4gPiArwqDCoMKgwqDCoMKgwqBpZiAocmV0cnkgPT0gbWF4X3JldHJp
ZXMpIHsKPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZnQ0MjIyX2kyY19y
ZXNldChmdGRpKTsKPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJu
IC1FVElNRURPVVQ7Cj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgfQo+ID4gPiA+ICvCoMKgwqDCoMKg
wqDCoGlmICghKHN0YXR1cyAmIEZUNDIyMl9JMkNfRVJST1IpKQo+ID4gPiA+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gMDsKPiA+ID4gPiArwqDCoMKgwqDCoMKgwqBpZiAo
c3RhdHVzICYgRlQ0MjIyX0kyQ19BRERSX05BQ0spCj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoHJldHVybiAtRU5YSU87Cj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgZWxzZSBp
ZiAoc3RhdHVzICYgRlQ0MjIyX0kyQ19EQVRBX05BQ0spCj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoHJldHVybiAtRUlPOwo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoGVsc2UK
PiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIC1FQlVTWTsKPiA+
ID4gPiArfQo+ID4gCj4gPiAuLi4KPiA+IAo+ID4gPiA+ICtzdGF0aWMgaW50IGZ0NDIyMl9pMmNf
cHJvYmUoc3RydWN0IHVzYl9pbnRlcmZhY2UgKmludGVyZmFjZSwKPiA+ID4gPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb25zdCBzdHJ1Y3Qg
dXNiX2RldmljZV9pZCAqaWQpCj4gPiA+ID4gK3sKPiA+ID4gPiArwqDCoMKgwqDCoMKgwqBlbnVt
IGZ0NDIyMl9jb25mX21vZGUgY29uZl9tb2RlOwo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoGludCBy
ZXQgPSBmdDQyMjJfZ2V0X2NvbmYoaW50ZXJmYWNlLCAmY29uZl9tb2RlKTsKPiA+ID4gPiArwqDC
oMKgwqDCoMKgwqBpbnQgaW50ZiA9IGludGVyZmFjZS0+Y3VyX2FsdHNldHRpbmctCj4gPiA+ID4g
PmRlc2MuYkludGVyZmFjZU51bWJlcjsKPiA+ID4gPiArCj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKg
aWYgKHJldCkKPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIHJl
dDsKPiA+ID4gPiArwqDCoMKgwqDCoMKgwqBpZiAoKChjb25mX21vZGUgPT0gZnQ0MjIyX2NvbmYw
KSB8fCAoY29uZl9tb2RlID09Cj4gPiA+ID4gZnQ0MjIyX2NvbmYzKSkgJiYKPiA+ID4gCj4gPiA+
IHdoYXQgYWJvdXQgY29uZjEyPwo+ID4gCj4gPiBBcyBtZW50aW9uZWQgaW4gdGhlIGNvbW1pdCBt
ZXNzYWdlLCB0aGUgSTJDIGZ1bmN0aW9uYWxpdHkgaXMgYXZhaWxhYmxlCj4gPiBvbmx5Cj4gPiB3
aGVuIHRoZSBjaGlwIGlzIGNvbmZpZ3VyZWQgaW4gbW9kZSAwIG9yIDMuIEluIG1vZGVzIDEgYW5k
IDIsIHRoZSBjaGlwCj4gPiBpbXBsZW1lbnRzIG90aGVyIGZ1bmN0aW9uYWxpdGllcywgZS5nLiBT
UEkuCj4gPiBJIHdpbGwgYWRkIGEgY29tbWVudCBpbiB0aGlzIGZ1bmN0aW9uLgo+IAo+IFdoYXQg
cHJldmVudHMgdXMgZnJvbSByZW1vdmluZyBjb25mMTIgYXQgYWxsPwoKT0ssIHJlbW92ZWQK


--=-LmyWZRNNHeFG/gmX0j3i
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEhleFT5U73KMewxTm7fE7c86UNl8FAmlqDksACgkQ7fE7c86U
Nl9qfAv/dc9Ki4RLLfrwiRLrGPN0iQ02qAvrAel+5lip277qmb7UttQaOf72/VjT
A9u8t1sfr/BFo+k+B1A2UPs8qzlvl4n+ICMyT9wsnKjRN9kEqr1gnHc3tO7yMP0z
vjlHHG5HKJgCBsSaP5auXCl5cX2045pgnEdNLdZ/NAIU/od5CsezOWZcKhUfv4nr
vvM/KoNOuJWP1f7moYsO3Um9XXZGMGozzIwLgNMtEmISFxdg8lU870nt0hwCU0g7
c+y8nXTgHlRyIWXTqiSTGzoHzfYaAAgOqBAVhjTiy0xbg7dw93uQCqCxTv9DARLE
OeZE5CFAPHp2ieD/iPti1FurcDc3R8Ee7EeXGM+5l4NFvzRJB5KzoQXXXYlDiCB/
2TyicmdhkxwJR2sPdYFgn0Gj5N1UlgZ32qWVMz9W28IjSytMMEKwLlZbdvV8R6mm
ilanMxhJwX6NF8EdtbPDTtbgn1UuF+IF1kXoKlYzRe7R2WCHXZUsbGi45K6qEDt6
HUxvE/jS
=bbMf
-----END PGP SIGNATURE-----

--=-LmyWZRNNHeFG/gmX0j3i--

