Return-Path: <linux-i2c+bounces-7483-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EAA79A5285
	for <lists+linux-i2c@lfdr.de>; Sun, 20 Oct 2024 07:03:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F3D6283B08
	for <lists+linux-i2c@lfdr.de>; Sun, 20 Oct 2024 05:02:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84FC24C7D;
	Sun, 20 Oct 2024 05:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="i+35v878"
X-Original-To: linux-i2c@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654F4CA6F;
	Sun, 20 Oct 2024 05:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729400578; cv=none; b=celVgVZ9bYMOvvKKpK1ip28C9jI2myh2XzEL3rG8mp2vXY0NUeEUXDAmXtBQ7bQSI5xSw0H9oGoWF83WupEQtTdCcW11ZcwB2m4u1on0xrTFmTw05FC5Q10/CYm6fn5xQf4x/T3r68O0wxD7cYdtU2pCKts2Iu0tTslDe2YybPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729400578; c=relaxed/simple;
	bh=bFkmHsub+ArssEkk1ccVXWxK8F7Fdp9v2gDg2fRo8DQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AZ9UjaKwb1g3nxj5NsLBxLyifR6Qt0yxE54igCFqle2cZkl1ChmZq3rbwnCd6vF7U7Q3p7XDrfvVapelU5QVGwczM12OXgBA+AgfFp2HRN9Y2ViHeLGHmYo4YAP2KIK2iJk8QMGy5sfHMUGUSj0m5HvcxMmzP6hohuWjbyJWlJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=i+35v878; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id B770A88E6B;
	Sun, 20 Oct 2024 07:02:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1729400568;
	bh=5Q9nlovKw/kqDdAjsD1yRTKyXSebN/44IKLBJF5kyQ8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=i+35v878Xu/4TdTm/oiKRAZd4MJBhgHkvn1tzeEkYsCKJKtV7GLNe569Pax5sUT1F
	 629KudQB+JgVippnFs60c1+PZksZocE4oPWMf09f9bEVPO9yPM9VisQD+Wk2n8qCNv
	 GVtEN2USnfvpOvPhzUqjW7Cnq4pjrv3jEIRTE/cvijIT8+uZEUubFqAUi+Ayy+/c9T
	 AgI7ttENR0EYUfdMFIo7xD7KexxMpdrko6sWgd17RD3F5fpo/ockgsUosNr9eUqNXg
	 tcrP95hahD2ooADhWg9WRgoDvsnAAGw0o5x3MeKxA/Twrz59KPHWkNZvloiX63wwVW
	 3HDUnGKQtk+0w==
Message-ID: <3aa9e2f4-b1ad-46bf-a8c3-0d57cd3a7075@denx.de>
Date: Sun, 20 Oct 2024 06:29:13 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: at24: add ST M24256E Additional Write
 lockable page support
To: Rob Herring <robh@kernel.org>
Cc: linux-i2c@vger.kernel.org,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org,
 kernel@dh-electronics.com
References: <20241017184152.128395-1-marex@denx.de>
 <20241018132754.GA54765-robh@kernel.org>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20241018132754.GA54765-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 10/18/24 3:27 PM, Rob Herring wrote:
> On Thu, Oct 17, 2024 at 08:41:25PM +0200, Marek Vasut wrote:
>> The ST M24256E behaves as a regular M24C256, except for the E variant
>> which uses up another I2C address for Additional Write lockable page.
>> This page is 64 Bytes long and can contain additional data. Add entry
>> for it, so users can describe that page in DT. Note that users still
>> have to describe the main M24C256 area separately as that is on separate
>> I2C address from this page.
> 
> I think this should be modelled as 1 node having 2 addresses, not 2
> nodes.
We had the exact same discussion regarding M24C32D, see:

https://lore.kernel.org/all/CAMRc=MdTu1gagX-L4_cHmN9aUCoKhN-b5i7yEeszKSdr+BuROg@mail.gmail.com/

