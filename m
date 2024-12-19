Return-Path: <linux-i2c+bounces-8631-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC4C9F796C
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Dec 2024 11:20:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB2FF16EDF9
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Dec 2024 10:20:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80606222D60;
	Thu, 19 Dec 2024 10:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mDors/XO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F42C222D5D;
	Thu, 19 Dec 2024 10:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734603593; cv=none; b=fHGpdHOVkSgPZES6L5K73sLW9RMNkmBED1Me0GxP2uFQLmBk4p5iiagYEOTF84oZFAgYrH2oZyXxazNLvX+dCE60WjkVJhd63M5Wjs6MIFuK+DgnU3TAwEgGXhktgqhWa+5M3kAPaCU1/i5V+sC/BGiFD3EMOFTaZnLldJdPPFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734603593; c=relaxed/simple;
	bh=tTWUVtXEPE6/RpxRTcoWhGZA8a+a993JiEflnuzutFE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j50SQOgjIG5oTB4o1ytOewu2hxiAQV5tOoiW3bQPF4FlVURY74LTepeMdk2dKvkWw5tHZ4rbpJlhhtzcWwblwRrgFUzUn+5AY9aYZwUS7MA9+T0cDzxOl6AuMODKPvojn29Ro+zsuLJerqxlk7ivUVlWzLzLF2042dd8FSYe23Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mDors/XO; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-aa68b513abcso118603966b.0;
        Thu, 19 Dec 2024 02:19:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734603589; x=1735208389; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2+xN/akLcGWoh80xccBoobmCy20PyxUxY64WwL6oZxQ=;
        b=mDors/XOsx/FuoL8WvVkTb1ghKP5f13O2hyJCXmG6QYvPMDzOCh1SBsRC2EVbR9v3Z
         t13VrkSwLuwnwRpy8mxDUOgR9G86TgzYdrgxriSLkpDC9apSFpmUqd+0W9z3HfwiGkSe
         WJgkB6OmtSbZLgW/9c27DNO19InDEUl4X0X6eZQhjq1yG/ZqPdCXJQYTcRf0rHWPrarp
         wTLUwlKAPhqJfyAnFO6CJXZuN34vnEou9YQCg13CI/md+Q3rdUqSBeWHOkHZZy3Bz2kT
         bag76PQ3qedmd2aYcnHHYyXQlgVIsti40m/n+JlxyB52wm28KY73D9WH+gjcgi2e9mEW
         oIvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734603589; x=1735208389;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2+xN/akLcGWoh80xccBoobmCy20PyxUxY64WwL6oZxQ=;
        b=ShQjYyc/DgZVSwZkfN/Z9HkUGnrarg4nXxXR7seRrIRo6E0cDKCN7w7WXsWo76GkL/
         NlNxofhZRcSTjxB8eq3TpPrtsXofM5NDfildT2LlIWcgF7/WY24TL263vHg1hUF9LV56
         R/ir77towRuoc53EEpC6kQsl5nUclvUKydLkiSU6ECKI3N4kBb3Duvy7kq9xjkx8rG2R
         GVqBzRT02DUaX2zwomYIXMF1e6rl4RL4/4pnESsnlJWlcUFGGFduCsqjqwIoO/UJfTuu
         tw5Jv13AzmwN7Va22qT9r0omXF8Z+b1wXG035k3mQSgLs8cj+1kcI2zrNOfurbwY068O
         tfLw==
X-Forwarded-Encrypted: i=1; AJvYcCV7bxHNvhaQlC3KgyaklRvnkvPwfYhwuSpXtlNwbfYnVfFOOfBg4j5RZd8VsjxWBl1VwkL/dTaLGvGjY90o@vger.kernel.org, AJvYcCVeKNTAeet0JoBj5lVpNq7OGzgOZeI+wx3YBTmYHlv+TK0R9r7fQPG9SI3AKgJ3xPSZVTd3Gv23XTbwCFYu/bg=@vger.kernel.org, AJvYcCWfMVvcoK8hmrlp/dOcQSd4sydJHBRDrBZIebKdXsgp67NXbOJ6xpL8f/07yg5rx1GCjYnED96eDzXD@vger.kernel.org, AJvYcCWuIp0tFug0AdkuAvMkMb4SFnsyc6bFRK52ZpvOjsxiPSu962+v/lQmpBgnrzsq3c8cmrY9LoBzajQpAUQ0@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+cnF8QaidXGUQRfFMxwJPEMIWN+pxjWiB6tbNWyLoljw0GTK2
	RmqHcTmd+ADjyZYxOMSOPKGsvlA67nUi+EHZ4e4Jq0fYYjduDXlL
X-Gm-Gg: ASbGncvaEzwVk5rjt01DabwX+/MnP4Q24iZIjDARkPPhvJkz4tJEbOwRropm85CnGEY
	YB/eHTQwrxwlXPM1kizEFTf5XrQKAC5Z4C7mWRvwzqL0rx0VZ6XVM8HfT2md7zcQado6naqmZ7C
	BO5Y7Mg6bcv9n2zFYXTeR5U8ZKO0H8mGznREoEpSznWO10ZWLaPK58OJYFbOOgaXYO5Y5s4gwyd
	n1BxM020sjsjjZ6O70euJLCyQthP/PCK6ZyaOxVB+6wDzYyrw9WA6BcJ6TnEXkHkOLXKS0iq9JP
	cy824hxM352SPDLGLzfbSOgXn/9v7mpXboIznmG+4o35UEf6F4xaROKUWNRHSHm1hTrgDptEsNZ
	td36+lsI=
X-Google-Smtp-Source: AGHT+IFx6H5RqyD+mw0we3BFNW7JJ1EFD9mC7UAMrP5EL99bTcuqMKsiN21Qp59zD2igpwFuY+o8Eg==
X-Received: by 2002:a17:906:328d:b0:aa6:79fa:b483 with SMTP id a640c23a62f3a-aabf44af144mr537559866b.0.1734603588728;
        Thu, 19 Dec 2024 02:19:48 -0800 (PST)
Received: from ?IPV6:2003:df:bf0d:b400:27b9:49e:98d:c022? (p200300dfbf0db40027b9049e098dc022.dip0.t-ipconnect.de. [2003:df:bf0d:b400:27b9:49e:98d:c022])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f06dc7esm48543866b.193.2024.12.19.02.19.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2024 02:19:48 -0800 (PST)
Message-ID: <907b470c-3b24-41ba-9b6d-c07caa30ee00@gmail.com>
Date: Thu, 19 Dec 2024 11:19:46 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] regulator: add driver for ncv6336 regulator
To: Fabien Parent <parent.f@gmail.com>, Rob Herring <robh@kernel.org>,
 Saravana Kannan <saravanak@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, vinod.koul@linaro.org,
 Fabien Parent <fabien.parent@linaro.org>
References: <20241218-ncv6336-v1-0-b8d973747f7a@gmail.com>
 <20241218-ncv6336-v1-8-b8d973747f7a@gmail.com>
Content-Language: de-AT-frami
From: Dirk Behme <dirk.behme@gmail.com>
In-Reply-To: <20241218-ncv6336-v1-8-b8d973747f7a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Fabien,

you might have noticed that I'm using your development branches of
this since some time. So sending these patches for review is a big
step! Many thanks!

Just one topic to check below:

On 19.12.24 00:36, Fabien Parent wrote:
> From: Fabien Parent <fabien.parent@linaro.org>
> 
> This commit adds support for the Onsemi NCV6336 buck down converter.
> 
> Signed-off-by: Fabien Parent <fabien.parent@linaro.org>
> ---
>  drivers/regulator/Kconfig              |   7 +
>  drivers/regulator/Makefile             |   1 +
>  drivers/regulator/ncv6336_regulator.rs | 241 +++++++++++++++++++++++++++++++++
>  3 files changed, 249 insertions(+)
> 
> diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
> index 39297f7d8177193e51c99bc2b360c6d9936e62fe..7254a6e1d7539b147b7ba00ebcb6fd92eb6b2616 100644
> --- a/drivers/regulator/Kconfig
> +++ b/drivers/regulator/Kconfig
> @@ -952,6 +952,13 @@ config REGULATOR_MTK_DVFSRC
>  	  of Mediatek. It allows for voting on regulator state
>  	  between multiple users.
>  
> +config REGULATOR_NCV6336
> +	tristate "Onsemi NCV6336 regulator driver"
> +	depends on RUST && OF && I2C=y
> +	select REGMAP_I2C
> +	help
> +	  Say y here to support the Onsemi NCV6336 buck converter.
> +
>  config REGULATOR_PALMAS
>  	tristate "TI Palmas PMIC Regulators"
>  	depends on MFD_PALMAS
> diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
> index 3d5a803dce8a0556ba9557fa069c6e37593b3c69..0309a78b820cc85883c0c129801ab713e08e4391 100644
> --- a/drivers/regulator/Makefile
> +++ b/drivers/regulator/Makefile
> @@ -113,6 +113,7 @@ obj-$(CONFIG_REGULATOR_MT6370) += mt6370-regulator.o
>  obj-$(CONFIG_REGULATOR_MT6380)	+= mt6380-regulator.o
>  obj-$(CONFIG_REGULATOR_MT6397)	+= mt6397-regulator.o
>  obj-$(CONFIG_REGULATOR_MTK_DVFSRC) += mtk-dvfsrc-regulator.o
> +obj-$(CONFIG_REGULATOR_NCV6336) += ncv6336_regulator.o
>  obj-$(CONFIG_REGULATOR_QCOM_LABIBB) += qcom-labibb-regulator.o
>  obj-$(CONFIG_REGULATOR_QCOM_PM8008) += qcom-pm8008-regulator.o
>  obj-$(CONFIG_REGULATOR_QCOM_REFGEN) += qcom-refgen-regulator.o
> diff --git a/drivers/regulator/ncv6336_regulator.rs b/drivers/regulator/ncv6336_regulator.rs
> new file mode 100644
> index 0000000000000000000000000000000000000000..7efd7630792b68fb353ed1b1634980def9e326a1
> --- /dev/null
> +++ b/drivers/regulator/ncv6336_regulator.rs
> @@ -0,0 +1,241 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Driver for the Onsemi Buck Converter NCV6336
> +//!
> +//! Datasheet: https://www.onsemi.com/pdf/datasheet/ncv6336bm-d.pdf
> +
> +use kernel::{
> +    c_str, i2c, of,
> +    prelude::*,
> +    regmap::{self, BitFieldReadOps, BitFieldWriteOps, RawFieldWriteOps},
> +    regulator::{
> +        driver::{Config, Desc, Device, Driver, RegmapHelpers, Status, Type},
> +        Mode,
> +    },
> +    sync::{new_mutex, Arc, Mutex},
> +};
> +use register::*;
> +
> +kernel::module_i2c_driver! {
> +    type: Ncv6336,
> +    name: "ncv6336",
> +    author: "Fabien Parent <fabien.parent@linaro.org>",
> +    license: "GPL",
> +}
> +
> +kernel::i2c_device_table!(
> +    I2C_ID_TABLE,
> +    MODULE_I2C_ID_TABLE,
> +    <Ncv6336 as i2c::Driver>::IdInfo,
> +    [(i2c::DeviceId::new(c_str!("ncv6336")), ()),]
> +);
> +
> +kernel::of_device_table!(
> +    OF_ID_TABLE,
> +    MODULE_OF_ID_TABLE,
> +    <Ncv6336 as i2c::Driver>::IdInfo,
> +    [(of::DeviceId::new(c_str!("onnn,ncv6336")), ()),]
> +);
> +
> +regmap::define_regmap_field_descs!(FIELD_DESCS, {
> +    (pid, 0x3, READ, { value => raw([7:0], ro) }),
> +    (rid, 0x4, READ, { value => raw([7:0], ro) }),
> +    (fid, 0x5, READ, { value => raw([7:0], ro) }),
> +    (progvsel1, 0x10, RW, {
> +        voutvsel1 => raw([6:0], rw),
> +        envsel1   => bit(7, rw),
> +    }),
> +    (progvsel0, 0x11, RW, {
> +        voutvsel0 => raw([6:0], rw),
> +        envsel0   => bit(7, rw),
> +    }),
> +    (pgood, 0x12, RW, { dischg => bit(4, rw) }),
> +    (command, 0x14, RW, {
> +        vselgt   => bit(0, rw),
> +        pwmvsel1 => bit(6, rw),
> +        pwmvsel0 => bit(7, rw),
> +    }),
> +    (limconf, 0x16, RW, {
> +        rearm     => bit(0, rw),
> +        rststatus => bit(1, rw),
> +        tpwth     => enum([5:4], rw, {
> +            Temp83C  = 0x0,
> +            Temp94C  = 0x1,
> +            Temp105C = 0x2,
> +            Temp116C = 0x3,
> +        }),
> +        ipeak     => enum([7:6], rw, {
> +            Peak3p5A = 0x0,
> +            Peak4p0A = 0x1,
> +            Peak4p5A = 0x2,
> +            Peak5p0A = 0x3,

Could you check to read from or write to the tpwth or ipeak (enum)
above? I've been under the impression that for that Desc & enum need
to Copy & Clone [1]?

[1]

diff --git a/rust/kernel/regmap.rs b/rust/kernel/regmap.rs
index 232fe93df769..d1baf182f53c 100644
--- a/rust/kernel/regmap.rs
+++ b/rust/kernel/regmap.rs
@@ -623,6 +623,7 @@ macro_rules! regmap_field_enum {
         kernel::macros::paste! {
             #[repr(u32)]
             #[allow(non_camel_case_types)]
+            #[derive(Copy, Clone)]
             pub(crate) enum [<$field_name _enum>] {
                 $($k = $v,)+
             }
diff --git a/rust/kernel/regulator/driver.rs
b/rust/kernel/regulator/driver.rs
index e79e93122b09..0b6819e46686 100644
--- a/rust/kernel/regulator/driver.rs
+++ b/rust/kernel/regulator/driver.rs
@@ -256,6 +256,7 @@ fn set_suspend_mode(_rdev: &mut
Device<Self::Data>, _mode: Mode) -> Result {
 /// # Invariants
 ///
 /// `self.0` has always valid data.
+#[derive(Copy, Clone)]
 pub struct Desc(bindings::regulator_desc);
 impl Desc {
     /// Create a new [`Device`] descriptor

> +static NCV6336_DESC: Desc = Desc::new::<Ncv6336>(c_str!("ncv6336"), Type::Voltage)
> +    .with_owner(&THIS_MODULE)
> +    .with_of_match(c_str!("buck"))
> +    .with_active_discharge(
> +        pgood::addr(),
> +        pgood::dischg::mask(),
> +        pgood::dischg::mask(),
> +        0,
> +    )
> +    .with_csel(
> +        limconf::addr(),
> +        limconf::ipeak::mask(),
> +        &[3_500_000, 4_000_000, 4_500_000, 5_000_000],
> +    )
> +    .with_enable(
> +        progvsel0::addr(),
> +        progvsel0::envsel0::mask(),
> +        progvsel0::envsel0::mask(),
> +        0,
> +    )
> +    .with_linear_mapping(
> +        progvsel0::addr(),
> +        progvsel0::voutvsel0::mask(),
> +        600_000,
> +        6250,
> +        128,
> +        0,
> +    );
> +
> +struct Ncv6336RegulatorData {
> +    fields: regmap::Fields<{ FIELD_DESCS.len() }>,
> +}
> +
> +struct Ncv6336(#[expect(dead_code)] Device<<Self as Driver>::Data>);
> +
> +impl i2c::Driver for Ncv6336 {
> +    type IdInfo = ();
> +
> +    const I2C_ID_TABLE: Option<i2c::IdTable<Self::IdInfo>> = Some(&I2C_ID_TABLE);
> +    const OF_ID_TABLE: Option<of::IdTable<Self::IdInfo>> = Some(&OF_ID_TABLE);
> +
> +    fn probe(client: &mut i2c::Client, _id_info: Option<&Self::IdInfo>) -> Result<Pin<KBox<Self>>> {
> +        let config = regmap::Config::<AccessOps>::new(8, 8)
> +            .with_max_register(0x16)
> +            .with_cache_type(regmap::CacheType::RbTree);
> +        let regmap = Arc::new(regmap::Regmap::init_i2c(client, &config)?, GFP_KERNEL)?;
> +        let fields = regmap::Fields::new(&regmap, &FIELD_DESCS)?;
> +
> +        let data = Arc::pin_init(new_mutex!(Ncv6336RegulatorData { fields }), GFP_KERNEL)?;
> +        let config = Config::new(client.as_ref(), data.clone()).with_regmap(regmap.clone());
> +        let regulator = Device::register(client.as_ref(), &NCV6336_DESC, config)?;
> +
> +        let drvdata = KBox::new(Self(regulator), GFP_KERNEL)?;
> +
> +        Ok(drvdata.into())
> +    }
> +}
> +
> +#[vtable]
> +impl Driver for Ncv6336 {
> +    type Data = Arc<Mutex<Ncv6336RegulatorData>>;
> +
> +    fn list_voltage(reg: &mut Device<Self::Data>, selector: u32) -> Result<i32> {
> +        reg.list_voltage_linear(selector)
> +    }
> +
> +    fn enable(reg: &mut Device<Self::Data>) -> Result {
> +        reg.enable_regmap()
> +    }
> +
> +    fn disable(reg: &mut Device<Self::Data>) -> Result {
> +        reg.disable_regmap()
> +    }
> +
> +    fn is_enabled(reg: &mut Device<Self::Data>) -> Result<bool> {
> +        reg.is_enabled_regmap()
> +    }
> +
> +    fn set_active_discharge(reg: &mut Device<Self::Data>, enable: bool) -> Result {
> +        reg.set_active_discharge_regmap(enable)
> +    }
> +
> +    fn set_current_limit(reg: &mut Device<Self::Data>, min_ua: i32, max_ua: i32) -> Result {
> +        reg.set_current_limit_regmap(min_ua, max_ua)
> +    }
> +
> +    fn get_current_limit(reg: &mut Device<Self::Data>) -> Result<i32> {
> +        reg.get_current_limit_regmap()
> +    }
> +
> +    fn set_voltage_sel(reg: &mut Device<Self::Data>, selector: u32) -> Result {
> +        reg.set_voltage_sel_regmap(selector)
> +    }
> +
> +    fn get_voltage_sel(reg: &mut Device<Self::Data>) -> Result<i32> {
> +        reg.get_voltage_sel_regmap()
> +    }
> +
> +    fn set_mode(reg: &mut Device<Self::Data>, mode: Mode) -> Result {
> +        let data = reg.data();
> +        let fields = &mut data.lock().fields;
> +
> +        match mode {
> +            Mode::Normal => command::pwmvsel0::clear(fields),
> +            Mode::Fast => command::pwmvsel0::set(fields),
> +            _ => Err(ENOTSUPP),
> +        }
> +    }
> +
> +    fn get_mode(reg: &mut Device<Self::Data>) -> Mode {
> +        let data = reg.data();
> +        let fields = &mut data.lock().fields;
> +
> +        match command::pwmvsel0::is_set(fields) {
> +            Ok(true) => Mode::Fast,
> +            Ok(false) => Mode::Normal,
> +            Err(_) => Mode::Invalid,
> +        }
> +    }
> +
> +    fn get_status(reg: &mut Device<Self::Data>) -> Result<Status> {
> +        if !Self::is_enabled(reg)? {
> +            return Ok(Status::Off);
> +        }
> +
> +        Ok(Self::get_mode(reg).into())
> +    }
> +
> +    fn set_suspend_voltage(reg: &mut Device<Self::Data>, uv: i32) -> Result {
> +        let data = reg.data();
> +        let fields = &mut data.lock().fields;
> +
> +        let quot = (uv - 600000) / 6250;
> +        let rem = (uv - 600000) % 6250;
> +        let selector = if rem > 0 { quot + 1 } else { quot };
> +
> +        progvsel1::voutvsel1::write(fields, selector as _)
> +    }
> +
> +    fn set_suspend_enable(reg: &mut Device<Self::Data>) -> Result {
> +        let data = reg.data();
> +        let fields = &mut data.lock().fields;
> +
> +        progvsel1::envsel1::set(fields)?;
> +        command::vselgt::clear(fields)
> +    }
> +
> +    fn set_suspend_disable(reg: &mut Device<Self::Data>) -> Result {
> +        let data = reg.data();
> +        let fields = &mut data.lock().fields;
> +
> +        progvsel1::envsel1::clear(fields)?;
> +        command::vselgt::set(fields)
> +    }
> +
> +    fn set_suspend_mode(reg: &mut Device<Self::Data>, mode: Mode) -> Result {
> +        let data = reg.data();
> +        let fields = &mut data.lock().fields;
> +
> +        match mode {
> +            Mode::Normal => command::pwmvsel1::clear(fields),
> +            Mode::Fast => command::pwmvsel1::set(fields),
> +            _ => Err(ENOTSUPP),
> +        }
> +    }
> +}
> 


