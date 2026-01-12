Return-Path: <linux-i2c+bounces-15077-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 20550D13FE2
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jan 2026 17:29:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C899C3027DA9
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jan 2026 16:26:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 271BC364E92;
	Mon, 12 Jan 2026 16:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Cby3WpKC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A137036402A
	for <linux-i2c@vger.kernel.org>; Mon, 12 Jan 2026 16:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768235210; cv=none; b=BEh2r0B2ZwV2W8hA6xuRZrPEYc83LF5XvjncEGzJz3r/PJIg54APtTtDyGT3ua7XDnZ+dzn7SsPFZLoWdKHS/ajORl/d8Hzo+VQYL3MDRTfuD715zkNTUUH9gYkI0gSdu+viztYhJOeETVGsEN8bs/t1R3DRrLPlTYCO2PS1TIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768235210; c=relaxed/simple;
	bh=v/2oEDaS96ozO4kO6gRHrrmMkbR9VJaXGvE0lXdu2Gg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lJZuQmR3yfrCxKYpAo/Lb5dZV4SEZJvx3cBVGvHeqRN8vE2aVuI78GFTRYWozHS6XlbbFpT8WpTfNVGwD5oBczN/hRFMshgy8s0E1DmXP3+w0iuvMQuR1jecrnw1zeqktZOEkdkC3a+5POVS7GC/fU+SR6LEY3NYqkV4vAjpsaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Cby3WpKC; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b870732cce2so210703066b.3
        for <linux-i2c@vger.kernel.org>; Mon, 12 Jan 2026 08:26:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1768235207; x=1768840007; darn=vger.kernel.org;
        h=mime-version:user-agent:organization:references:in-reply-to:date:cc
         :to:from:subject:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v/2oEDaS96ozO4kO6gRHrrmMkbR9VJaXGvE0lXdu2Gg=;
        b=Cby3WpKCkB+cIoVI/K6figlXuV6vY2y69W84Iu1JfxeR435Ifw9WEsKCc+Yy6BRA3V
         FdX6+9S+svsBevFGD0O/85H2hAiRQJkxU+Bz+clGFsM/76jSA6+h4Kib2Pnz/mibLyWM
         VIueYEiqtX0fPJ/5d/6u0W/nVk8dG0lNx5/QmVgiuR+Yx70odblweWbX+1LexRtzo61+
         EMSrhWAYd7cx5FvaiQ2NXPe4y+Qo0O/ZEO8gL+mQcyhqrb9jlL7H/KUi4dSxj73Trjr7
         aB8WIbmsOr1Vg/TbrZWqrdAGsnsIkxi5gqo04q6Z/oolo5QbMPozHqfCxz//pxP6MYsP
         lMIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768235207; x=1768840007;
        h=mime-version:user-agent:organization:references:in-reply-to:date:cc
         :to:from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v/2oEDaS96ozO4kO6gRHrrmMkbR9VJaXGvE0lXdu2Gg=;
        b=nZjv3rC4RGSe4CT5VOWU81Yqn9yZAnxs7gXeVdDq+XLa8fcOq2BIxQiMdGmgnhsi/H
         yIYActn2WsscWPmKqMNeZ09CeK6ETRvdZPv3ZUhi2UVeLfL0y0SBzqgH4Gs0OQimyC7A
         ih0Y0Mzz87iBWn6zfXItdJuzpQzGxAEOI8qqg2OmMiyTyLZAlhPB0Rrc63UFAeEgI3Vs
         dqiVzrRQ2612PyrO8hasWC09J7eVG4D4FnW/HmYKap43rT5iwK1EqREeYEZfL2LQKcK2
         F5Da0zdVvCrQXYX0nO+D+YR7coQN5wk26luBG1FRaJzESV6ygCPFsd55RYqratL1uOWR
         0/FQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3qb9TRZCBTIk6AZxSwZXbMBqi1oLEJyZRQW4ktf06GwZ926ubbSMjtsA+KcukiyDvwGZPxovXoDo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeS7tdjpCWC+df9X1LJYmpG2x7+psRFLZs/7BsHfJ6o9NzkR3w
	Qbt8vJyx8o6bshyB751M64rYUYvFhWQHAQ2qCclJ87ojLBcCyyHN58hA2NPqa8A8dmM=
X-Gm-Gg: AY/fxX6eCpBJpnFWd3mEdgzxahN52wL0OD50F+3Q+cXjKyDQFNtet+nrqj4YDYdQKBX
	YBnIKXSKZ1DvG7JXdjmdWtYeQCaIj4i4N0YpKPMzFS/eLGo6k0oi/LBfzer3RoticXrOGLGPHxt
	UKiAN7UBckTBBE8+mxNr4JtUJubGORnhQRj82Bs9FK1kzp7DVS/grpFu+s1GIRyvGmU3EDFWFe0
	kK59HbIkpa4jDj68GYi3d0o9uHYhRn+zL+XdtLswfBFgBXt0jE7PuaTn+zRIWo3qQPGSNqIj18U
	zNYd4P3ug3WhlLvfgaE2ufhi29xP/smxc3kKs/fjSYRC1Tio5CcJLlG64/HFOFllCTfsg+r5oCD
	0bdg2vTRnz35l94jQ4/KkE+CnGPcWzKXh2v1JdyF0F3+B4c37u7LvchUNYq33Ae0D2u1C7AcVe+
	VTnxh59ba2e+iHrA==
X-Google-Smtp-Source: AGHT+IGhAc26ZVbdVZ5fZlAUTVdK4PkqTZbrra+eiKBFLmdFZGDzMjSsq7Hg1YumEO9G8Hy+JFvl+w==
X-Received: by 2002:a17:907:7215:b0:b87:293f:1209 with SMTP id a640c23a62f3a-b87293f1b9emr181245866b.1.1768235206975;
        Mon, 12 Jan 2026 08:26:46 -0800 (PST)
Received: from [10.203.83.61] ([151.35.240.230])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a27c760sm2006410066b.24.2026.01.12.08.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 08:26:46 -0800 (PST)
Message-ID: <a503fea8fdf4156526d473ee2208b42b896b50c1.camel@baylibre.com>
Subject: Re: [PATCH] i2c: Add FTDI FT4222H USB I2C adapter
From: Francesco Lavra <flavra@baylibre.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Date: Mon, 12 Jan 2026 17:26:40 +0100
In-Reply-To: <aV5aM4OgIeJtsxlb@zenone.zhora.eu>
References: <20260106170807.3964886-1-flavra@baylibre.com>
	 <aV5aM4OgIeJtsxlb@zenone.zhora.eu>
Organization: BayLibre
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-x2wiMGrk8+HOozwTTlC9"
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-x2wiMGrk8+HOozwTTlC9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

SGkgQW5kaSwKCk9uIFdlZCwgMjAyNi0wMS0wNyBhdCAxNDozOCArMDEwMCwgQW5kaSBTaHl0aSB3
cm90ZToKPiBIaSBGcmFuY2VzY28sCj4gCj4gSSBkaWQganVzdCBhIHF1aWNrIGluaXRpYWwgcmV2
aWV3LgoKLi4uCgo+ID4gK3N0YXRpYyBpbnQgZnQ0MjIyX2kyY19nZXRfc3RhdHVzKHN0cnVjdCBm
dDQyMjJfaTJjICpmdGRpKQo+ID4gK3sKPiA+ICvCoMKgwqDCoMKgwqDCoHU4IHN0YXR1czsKPiA+
ICvCoMKgwqDCoMKgwqDCoGludCByZXRyeTsKPiA+ICvCoMKgwqDCoMKgwqDCoGNvbnN0IGludCBt
YXhfcmV0cmllcyA9IDUxMjsKPiAKPiB3aHkgNTEyPwoKVGhlc2UgcmV0cmllcyBhcmUgbmVlZGVk
IG1vc3RseSB3aGVuIHJldHJpZXZpbmcgdGhlIHN0YXR1cyBhZnRlciBkb2luZyBhCndyaXRlIHdp
dGggdGhlIEkyQyBidXMgb3BlcmF0aW5nIGF0IGEgbG93IHNwZWVkLgpEb2luZyB2YXJpb3VzIHRl
c3RzIGF0IDEwMCBrSHosIEkgc2F3IHRoYXQgYWZ0ZXIgYSBtYXhpbXVtLXNpemVkICg1MTItYnl0
ZSkKd3JpdGUsIHVwIHRvIDExIHJldHJpZXMgYXJlIG5lZWRlZCBiZWZvcmUgdGhlIGNoaXAgY2xl
YXJzIGl0cyBDVFJMX0JVU1kKZmxhZy4gQnV0IHVuZGVyIGNlcnRhaW4gY29uZGl0aW9ucyB3ZSBt
YXkgbmVlZCBtb3JlIHJldHJpZXMsIGZvciBleGFtcGxlIGlmCkkgZGlzY29ubmVjdCB0aGUgU0NM
IGxpbmUgYW5kIHRoZW4gdHJ5IHRvIGRvIGEgd3JpdGUsIEkgc2VlIHRoYXQgdXAgdG8gNjQKcmV0
cmllcyBhcmUgbmVlZGVkLgpTbyBJIGd1ZXNzIDUxMiBtYXhfcmV0cmllcyBpcyB0b28gbXVjaCwg
YnV0IHdlIG5lZWQgYSB2YWx1ZSA+IDY0LiBEb2VzIDEyOApzb3VuZCBPSyB0byB5b3U/IFBlcmhh
cHMgSSBjYW4gYWRkIGEgY29tbWVudCB3aXRoIHRoZSBhYm92ZSBvYnNlcnZhdGlvbnMuCgo+ID4g
K8KgwqDCoMKgwqDCoMKgZm9yIChyZXRyeSA9IDA7IHJldHJ5IDwgbWF4X3JldHJpZXM7IHJldHJ5
KyspIHsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpbnQgcmV0ID0gZnQ0MjIy
X2NtZF9nZXQoZnRkaSwgMHhmNWI0LCAmc3RhdHVzKTsKPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqBpZiAocmV0IDwgMCkKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIHJldDsKPiA+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqBpZiAoIShzdGF0dXMgJiBGVDQyMjJfSTJDX0NUUkxfQlVTWSkpCj4gPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGJyZWFrOwo+ID4g
K8KgwqDCoMKgwqDCoMKgfQo+ID4gK8KgwqDCoMKgwqDCoMKgZGV2X2RiZygmZnRkaS0+YWRhcHRl
ci5kZXYsICJzdGF0dXMgMHglMDJ4ICglZCByZXRyaWVzKSIsCj4gPiBzdGF0dXMsCj4gPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0cnkpOwo+IAo+IHdob3VsZCB0aGlzIGRlYnVn
IG1lc3NhZ2UgYmUgcHJpbnRlZCBhZnRlciB0aGUgY2hlY2sgYmVsb3c/CgpOb3Qgc3VyZSBJIHVu
ZGVyc3Rvb2QgeW91ciBxdWVzdGlvbi4gQXJlIHlvdSBzdWdnZXN0aW5nIHRvIG1vdmUgdGhlCmRl
dl9kYmcoKSBjYWxsIGFmdGVyIHRoZSBjaGVjayBiZWxvdz8gSSBwdXQgaXQgYmVmb3JlIHRoZSBj
aGVjayBzbyB0aGF0IEkKZ2V0IGEgZGVidWcgbWVzc2FnZSBldmVuIGlmIHRoZSBtYXhpbXVtIG51
bWJlciBvZiByZXRyaWVzIGhhcyBiZWVuIHJlYWNoZWQuCgo+ID4gK8KgwqDCoMKgwqDCoMKgaWYg
KHJldHJ5ID09IG1heF9yZXRyaWVzKSB7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgZnQ0MjIyX2kyY19yZXNldChmdGRpKTsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqByZXR1cm4gLUVUSU1FRE9VVDsKPiA+ICvCoMKgwqDCoMKgwqDCoH0KPiA+ICvCoMKgwqDC
oMKgwqDCoGlmICghKHN0YXR1cyAmIEZUNDIyMl9JMkNfRVJST1IpKQo+ID4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiAwOwo+ID4gK8KgwqDCoMKgwqDCoMKgaWYgKHN0YXR1
cyAmIEZUNDIyMl9JMkNfQUREUl9OQUNLKQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoHJldHVybiAtRU5YSU87Cj4gPiArwqDCoMKgwqDCoMKgwqBlbHNlIGlmIChzdGF0dXMgJiBG
VDQyMjJfSTJDX0RBVEFfTkFDSykKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBy
ZXR1cm4gLUVJTzsKPiA+ICvCoMKgwqDCoMKgwqDCoGVsc2UKPiA+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqByZXR1cm4gLUVCVVNZOwo+ID4gK30KCi4uLgoKPiA+ICtzdGF0aWMgaW50
IGZ0NDIyMl9pMmNfcHJvYmUoc3RydWN0IHVzYl9pbnRlcmZhY2UgKmludGVyZmFjZSwKPiA+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbnN0
IHN0cnVjdCB1c2JfZGV2aWNlX2lkICppZCkKPiA+ICt7Cj4gPiArwqDCoMKgwqDCoMKgwqBlbnVt
IGZ0NDIyMl9jb25mX21vZGUgY29uZl9tb2RlOwo+ID4gK8KgwqDCoMKgwqDCoMKgaW50IHJldCA9
IGZ0NDIyMl9nZXRfY29uZihpbnRlcmZhY2UsICZjb25mX21vZGUpOwo+ID4gK8KgwqDCoMKgwqDC
oMKgaW50IGludGYgPSBpbnRlcmZhY2UtPmN1cl9hbHRzZXR0aW5nLT5kZXNjLmJJbnRlcmZhY2VO
dW1iZXI7Cj4gPiArCj4gPiArwqDCoMKgwqDCoMKgwqBpZiAocmV0KQo+ID4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiByZXQ7Cj4gPiArwqDCoMKgwqDCoMKgwqBpZiAoKChj
b25mX21vZGUgPT0gZnQ0MjIyX2NvbmYwKSB8fCAoY29uZl9tb2RlID09Cj4gPiBmdDQyMjJfY29u
ZjMpKSAmJgo+IAo+IHdoYXQgYWJvdXQgY29uZjEyPwoKQXMgbWVudGlvbmVkIGluIHRoZSBjb21t
aXQgbWVzc2FnZSwgdGhlIEkyQyBmdW5jdGlvbmFsaXR5IGlzIGF2YWlsYWJsZSBvbmx5CndoZW4g
dGhlIGNoaXAgaXMgY29uZmlndXJlZCBpbiBtb2RlIDAgb3IgMy4gSW4gbW9kZXMgMSBhbmQgMiwg
dGhlIGNoaXAKaW1wbGVtZW50cyBvdGhlciBmdW5jdGlvbmFsaXRpZXMsIGUuZy4gU1BJLgpJIHdp
bGwgYWRkIGEgY29tbWVudCBpbiB0aGlzIGZ1bmN0aW9uLgoKPiA+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoCAoaW50ZiA9PSAwKSkKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1
cm4gZnQ0MjIyX2kyY19pbml0KGludGVyZmFjZSk7Cj4gPiArwqDCoMKgwqDCoMKgwqByZXR1cm4g
LUVOT0RFVjsKCg==


--=-x2wiMGrk8+HOozwTTlC9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEhleFT5U73KMewxTm7fE7c86UNl8FAmllIMAACgkQ7fE7c86U
Nl8mCAv8CExa3yzNu+g3uF/dIoCg5fip8fcDqZluasLHjybTwEN7nOkp4R2OOyXq
lpmZtX57PKkqZAAoUFGJztJq/luQgwF8XOEXIsNi2OG0/5+DvSu3VBYJacV6VFn4
7dbvRhYfbMLb+WaXinaGgrYFggopes4sSwXyXffwXl64TVsd+Sif9eB6+NGtyhFs
nPAxjKLM/ZndB4yECFmoc9UBlh1pkImFRW5o2VdDsCTHQtQqjrseIhAOkGKpR0O9
rmhGK/m2YwiGxELjcuaKkoIqa41kOfOr2A7Y7phjBeLknwMNzOfcZDgG1juq9vh6
2se8xyOjZ9S8+MVL4hDPEDN/CkJXXH/8vY4bUMQHm/ZcPwJpzcorWvv8jYsvMX3f
DmqwP5rqig1opHPcavKhvQp6oeTXuo8zObqa9UsEzSz/LJuHUA4mO4qH6/X4SEMN
ZoJF+52wp9t7Ptuq5ko1WzPB7ZVFl3jRtnZtTczF9U5vlIxoo+j0OsoIlX466nHj
kBHvhq8S
=+Cns
-----END PGP SIGNATURE-----

--=-x2wiMGrk8+HOozwTTlC9--

