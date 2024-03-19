Return-Path: <linux-i2c+bounces-2412-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 666D38805CA
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Mar 2024 21:02:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D2799B21505
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Mar 2024 20:02:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 902AF5FB88;
	Tue, 19 Mar 2024 20:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gKLCIgNF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40FBD5F870;
	Tue, 19 Mar 2024 20:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710878532; cv=none; b=iZ0vNg279JoxAR1pFq+XhzgB9GmmyWOVRJYobiq3OKk3h7Zw7oT2x0NX7LdN9f63RYtv5F17Dqqy2xmLA7MUN7e0zHYKy+anLRC10mv7gpEMVflX5G1A+aoocCXqGz2lQmOnJxF1fjdYlq+TlbrD2o5pnzo3J3KuA56TraSMxCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710878532; c=relaxed/simple;
	bh=O6uDlq3eBUzdHsJI64CE5ZRz8AeG+vv8k4a1TPcbhXg=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=lPGpaWoXWbE3H0oNHyuofR+FmXa5Cpm0XN4Uvu4VEYe4xX6vDcprRvCnu8SVTXB1NKsU5OzQZ4JqLFmap3TNDPo8gRtFASpV1rPof5ntRM8Qb4qpjqYU4HrRgvtegtHvYZ0Xzy4ak6p4FG90NwmsuG4Q9uwzl2229wwhHN9Csj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gKLCIgNF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99127C433C7;
	Tue, 19 Mar 2024 20:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710878531;
	bh=O6uDlq3eBUzdHsJI64CE5ZRz8AeG+vv8k4a1TPcbhXg=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=gKLCIgNFf7GepDV3C5AFJyh81QEal+Lk34/d3k8huExJEn3nRMnS/Cy4b3MntZl9R
	 3VDVi+ISOTDxQQDBVEFGVwUkO/EB2gL540nQ73A7FXxpVLl6ViMUROZL5rgZp3qOWZ
	 MT4HWSBxLBApKlisO5LvqxrLybQpGghJfjfpJPr+1KONiCkwuQxbxmXJWnxe13+q0u
	 esQzLRMvhJdI81gs8oYp1PgUr5+ggHgHS+7gN5Q5brambpajs+joWRRVR0muakV9yE
	 kebiMZdlhsLk3+7sy6tRAFQ5daRGtIbcRsiBFeLz7DinT+XyUUm+T+mJXxpTgPwKcj
	 cw8UBSTsDOLRg==
Date: Tue, 19 Mar 2024 15:02:10 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Radu Sabau <radu.sabau@analog.com>
Cc: linux-kernel@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, 
 Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
In-Reply-To: <20240319113213.19083-1-radu.sabau@analog.com>
References: <20240319113213.19083-1-radu.sabau@analog.com>
Message-Id: <171087317783.5366.10280283187267653875.robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: pmbus: adp1050 : add
 bindings


On Tue, 19 Mar 2024 13:32:02 +0200, Radu Sabau wrote:
> Add dt-bindings for adp1050 digital controller for isolated power supply
> with pmbus interface voltage, current and temperature monitor.
> 
> Signed-off-by: Radu Sabau <radu.sabau@analog.com>
> ---
>  .../bindings/hwmon/pmbus/adi,adp1050.yaml     | 52 +++++++++++++++++++
>  MAINTAINERS                                   |  7 +++
>  2 files changed, 59 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/adi,adp1050.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Traceback (most recent call last):
  File "/usr/lib/python3/dist-packages/requests/models.py", line 971, in json
    return complexjson.loads(self.text, **kwargs)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/lib/python3.11/json/__init__.py", line 346, in loads
    return _default_decoder.decode(s)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/lib/python3.11/json/decoder.py", line 337, in decode
    obj, end = self.raw_decode(s, idx=_w(s, 0).end())
               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/lib/python3.11/json/decoder.py", line 355, in raw_decode
    raise JSONDecodeError("Expecting value", s, err.value) from None
json.decoder.JSONDecodeError: Expecting value: line 1 column 1 (char 0)

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/usr/local/lib/python3.11/dist-packages/jsonschema/validators.py", line 912, in resolve_from_url
    document = self.resolve_remote(url)
               ^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/lib/python3.11/dist-packages/jsonschema/validators.py", line 1015, in resolve_remote
    result = requests.get(uri).json()
             ^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/lib/python3/dist-packages/requests/models.py", line 975, in json
    raise RequestsJSONDecodeError(e.msg, e.doc, e.pos)
requests.exceptions.JSONDecodeError: Expecting value: line 1 column 1 (char 0)

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/usr/local/bin/dt-doc-validate", line 8, in <module>
    sys.exit(main())
             ^^^^^^
  File "/usr/local/lib/python3.11/dist-packages/dtschema/doc_validate.py", line 66, in main
    ret |= check_doc(f)
           ^^^^^^^^^^^^
  File "/usr/local/lib/python3.11/dist-packages/dtschema/doc_validate.py", line 29, in check_doc
    for error in sorted(dtsch.iter_errors(), key=lambda e: e.linecol):
                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/lib/python3.11/dist-packages/dtschema/schema.py", line 120, in iter_errors
    meta_schema = self.resolver.resolve_from_url(self['$schema'])
                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/lib/python3.11/dist-packages/jsonschema/validators.py", line 914, in resolve_from_url
    raise exceptions.RefResolutionError(exc)
jsonschema.exceptions.RefResolutionError: Expecting value: line 1 column 1 (char 0)
Documentation/devicetree/bindings/hwmon/pmbus/adi,adp1050.example.dts:26.17-30: Warning (reg_format): /example-0/i2c/adp1050@70:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 0)
Documentation/devicetree/bindings/hwmon/pmbus/adi,adp1050.example.dtb: Warning (pci_device_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/hwmon/pmbus/adi,adp1050.example.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/hwmon/pmbus/adi,adp1050.example.dtb: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/hwmon/pmbus/adi,adp1050.example.dts:18.13-29.11: Warning (i2c_bus_bridge): /example-0/i2c: incorrect #address-cells for I2C bus
Documentation/devicetree/bindings/hwmon/pmbus/adi,adp1050.example.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/hwmon/pmbus/adi,adp1050.example.dtb: Warning (i2c_bus_reg): Failed prerequisite 'i2c_bus_bridge'
Documentation/devicetree/bindings/hwmon/pmbus/adi,adp1050.example.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/hwmon/pmbus/adi,adp1050.example.dts:22.24-28.15: Warning (avoid_default_addr_size): /example-0/i2c/adp1050@70: Relying on default #address-cells value
Documentation/devicetree/bindings/hwmon/pmbus/adi,adp1050.example.dtb: Warning (unique_unit_address_if_enabled): Failed prerequisite 'avoid_default_addr_size'
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/hwmon/pmbus/adi,adp1050.example.dtb: i2c: '#address-cells' is a dependency of '#size-cells'
	from schema $id: http://devicetree.org/schemas/reg.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/hwmon/pmbus/adi,adp1050.example.dtb: adp1050@70: '#adress-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: https://devicetree.org/schemas/hwmon/pmbus/adi,adp1050.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/hwmon/pmbus/adi,adp1050.example.dtb: adp1050@70: '#address-cells' is a dependency of '#size-cells'
	from schema $id: http://devicetree.org/schemas/reg.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240319113213.19083-1-radu.sabau@analog.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


