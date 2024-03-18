Return-Path: <linux-i2c+bounces-2387-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A6787EA24
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Mar 2024 14:32:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 804371C21315
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Mar 2024 13:32:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94D43481A8;
	Mon, 18 Mar 2024 13:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JoWBWv0c"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433524779F;
	Mon, 18 Mar 2024 13:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710768754; cv=none; b=BIlQR7t2uifTVDkhVP1g8ZHgd/3E3ix0M4MHot+ioDrM0S7hYFk4DhGu+1jrg143QLqxZKqT1fqeGMYW4kG8bJQZ3wCswJee7obhlrUWZWa0mPtOrl8oGvTBafBp9/kXmcoMaRMalilksKnMMk1ghreO2ySSIGyMQDRRZUHoCk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710768754; c=relaxed/simple;
	bh=AStjgGz1aVGdgWC0olIWNxofBmcPu5GxQJHWi09EwfI=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=KQK5vsIpKrzDnyr5aM1/9kn+HST0+wVOb/FKWCZaJlRdcqhmZn25ZNa+NhAKRuSONaJKoPQTPRxpkIjXgBv4fDPPLBEaZcq1z6rv5n0p8kZVWgSnGnO2pUiU+GqrK91zGyneAGEs4c1ij7LtxSTuog5+1eArpjMsJx/GbWa72EM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JoWBWv0c; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91670C433C7;
	Mon, 18 Mar 2024 13:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710768753;
	bh=AStjgGz1aVGdgWC0olIWNxofBmcPu5GxQJHWi09EwfI=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=JoWBWv0cuJ9IM+9IABxMlIxfeJUuM2xLsKhsCoLRIVGM67dMHmfhLnoQLl60ACK02
	 wE+ZAmYUnY/wgHAWsx0kpkElHxu7Z7CNCWJdBWLabRiTqLcIfP3zJji2tRq4+1ShI4
	 o3QV7YCpu9e3Rvfnd+JX9SGf5OYzKSsI0fqrJ8vmwnNOEldd4fSqMNFrux2zHiId0c
	 Q2OzrqOpPGuTIFp0Mk5PnkVzd/kRXy09qxLsPRixRx/aTPK9KWTevWnW8b2F2u8BeD
	 PbjysoPFdeSfb84a9y/86kaVaB/L5vtarXNvUXdin0yfMlGlHWR3oRsEbLxcluDUFY
	 Eu1dmSlD1KDOg==
Date: Mon, 18 Mar 2024 08:32:32 -0500
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
Cc: linux-doc@vger.kernel.org, 
 Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>, 
 Jean Delvare <jdelvare@suse.com>, linux-kernel@vger.kernel.org, 
 linux-i2c@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, 
 Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org, 
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Jonathan Corbet <corbet@lwn.net>
In-Reply-To: <20240318112140.385244-2-radu.sabau@analog.com>
References: <20240318112140.385244-1-radu.sabau@analog.com>
 <20240318112140.385244-2-radu.sabau@analog.com>
Message-Id: <171076875140.3796564.15360052734437443264.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: pmbus: adp1050 : add bindings


On Mon, 18 Mar 2024 13:21:34 +0200, Radu Sabau wrote:
> Add dt-bindings for adp1050 digital controller for isolated power supply
> with pmbus interface voltage, current and temperature monitor.
> 
> Signed-off-by: Radu Sabau <radu.sabau@analog.com>
> ---
>  .../bindings/hwmon/pmbus/adi,adp1050.yaml     | 65 +++++++++++++++++++
>  MAINTAINERS                                   |  8 +++
>  2 files changed, 73 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/adi,adp1050.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Traceback (most recent call last):
  File "/usr/local/lib/python3.11/dist-packages/jsonschema/validators.py", line 909, in resolve_from_url
    document = self.store[url]
               ~~~~~~~~~~^^^^^
  File "/usr/local/lib/python3.11/dist-packages/jsonschema/_utils.py", line 28, in __getitem__
    return self.store[self.normalize(uri)]
           ~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^
KeyError: 'htpps://devicetree.org/meta-schemes/core.yaml'

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/usr/local/lib/python3.11/dist-packages/jsonschema/validators.py", line 912, in resolve_from_url
    document = self.resolve_remote(url)
               ^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/lib/python3.11/dist-packages/jsonschema/validators.py", line 1018, in resolve_remote
    with urlopen(uri) as url:
         ^^^^^^^^^^^^
  File "/usr/lib/python3.11/urllib/request.py", line 216, in urlopen
    return opener.open(url, data, timeout)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/lib/python3.11/urllib/request.py", line 519, in open
    response = self._open(req, data)
               ^^^^^^^^^^^^^^^^^^^^^
  File "/usr/lib/python3.11/urllib/request.py", line 541, in _open
    return self._call_chain(self.handle_open, 'unknown',
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/lib/python3.11/urllib/request.py", line 496, in _call_chain
    result = func(*args)
             ^^^^^^^^^^^
  File "/usr/lib/python3.11/urllib/request.py", line 1419, in unknown_open
    raise URLError('unknown url type: %s' % type)
urllib.error.URLError: <urlopen error unknown url type: htpps>

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
jsonschema.exceptions.RefResolutionError: <urlopen error unknown url type: htpps>
Error: Documentation/devicetree/bindings/hwmon/pmbus/adi,adp1050.example.dts:33.3-34.1 syntax error
FATAL ERROR: Unable to parse input tree
make[2]: *** [scripts/Makefile.lib:419: Documentation/devicetree/bindings/hwmon/pmbus/adi,adp1050.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1428: dt_binding_check] Error 2
make: *** [Makefile:240: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240318112140.385244-2-radu.sabau@analog.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


