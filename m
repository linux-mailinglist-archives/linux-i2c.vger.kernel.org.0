Return-Path: <linux-i2c+bounces-9333-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 83DCCA2BAEF
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Feb 2025 06:58:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B44BA3A2050
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Feb 2025 05:58:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 212241494B5;
	Fri,  7 Feb 2025 05:58:12 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net [60.248.80.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FBF0FC1D;
	Fri,  7 Feb 2025 05:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.248.80.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738907892; cv=none; b=tNUtRmqr+Y5fFcn/npqN7QzXSQioZ+xcZDf40bvmuWM7+dVZi0yV1xRdMrZUA3MEIavYQo+nFOWZuqtyhiae1Iivuk7CuKuL82SmAY/s5mEBfIQyoGO2OUUxAdKogTGJBHDnEtcpkwjamAjsuqss+fQcBVFP5WWb4T8lasd+f88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738907892; c=relaxed/simple;
	bh=QwbgKWrZdSQXCmPW4r/hjRAMXShyOHMehi8qwjWZeKA=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lbvCQVZeMY+ZkH5Nmmv3T3f5+IUQ5UaOvBH7uC+JMwqES89UiHGxMsb1MT+SRt+Fmc4a3TAJZ9cSflsEHBD9fdlcdl+jMjFSZAOBUaIoYMqrfYq9dotgPHfSYnPBrdB/skWV+4/taSlQCqwI5bYQgVrbWrKsHt/ssXSs+DMZyXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=andestech.com; spf=pass smtp.mailfrom=andestech.com; arc=none smtp.client-ip=60.248.80.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
	by Atcsqr.andestech.com with ESMTPS id 5175vrmY048293
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
	Fri, 7 Feb 2025 13:57:53 +0800 (+08)
	(envelope-from ben717@andestech.com)
Received: from atctrx.andestech.com (10.0.15.11) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 7 Feb
 2025 13:57:53 +0800
Date: Fri, 7 Feb 2025 13:57:53 +0800
From: Ben Zong-You Xie <ben717@andestech.com>
To: "Rob Herring (Arm)" <robh@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>
CC: <andi.shyti@kernel.org>, <conor+dt@kernel.org>, <krzk+dt@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: i2c: add atciic100
Message-ID: <Z6Wg4fdZUumz+mzC@atctrx.andestech.com>
References: <20250207021923.2912373-1-ben717@andestech.com>
 <20250207021923.2912373-2-ben717@andestech.com>
 <173889862402.2987410.13412749871607541822.robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <173889862402.2987410.13412749871607541822.robh@kernel.org>
User-Agent: Mutt/2.1.4 (2021-12-11)
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs34.andestech.com; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:Atcsqr.andestech.com 5175vrmY048293

On Thu, Feb 06, 2025 at 09:23:44PM -0600, Rob Herring (Arm) wrote:
> [EXTERNAL MAIL]
> 
> On Fri, 07 Feb 2025 10:19:22 +0800, Ben Zong-You Xie wrote:
> > Document devicetree bindings for Andes I2C controller.
> >
> > Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>
> > ---
> >  .../bindings/i2c/andestech,i2c-atciic100.yaml | 40 +++++++++++++++++++
> >  MAINTAINERS                                   |  5 +++
> >  2 files changed, 45 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/i2c/andestech,i2c-atciic100.yaml
> >
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i2c/andestech,i2c-atciic100.yaml: $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename
>          $id: http://devicetree.org/schemas/pwm/andestech,atciic100.yaml
>         file: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i2c/andestech,i2c-atciic100.yaml
> 
> doc reference errors (make refcheckdocs):
> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/i2c/andestech,atciic100.yaml
> MAINTAINERS: Documentation/devicetree/bindings/i2c/andestech,atciic100.yaml
> 
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250207021923.2912373-2-ben717@andestech.com
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
> 

Hi Rob,

Thanks for your reminder. I found there are some errors in the YAML file and
MAINTAINERS file for my patch. I will fix them and check with 'make dt_binding_check'
before sending new patches.

Best regards,
Ben


