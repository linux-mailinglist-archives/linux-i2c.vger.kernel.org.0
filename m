Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D07D1AE737
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2019 11:43:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388129AbfIJJne (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 Sep 2019 05:43:34 -0400
Received: from mga07.intel.com ([134.134.136.100]:52456 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731809AbfIJJne (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 10 Sep 2019 05:43:34 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 10 Sep 2019 02:43:33 -0700
X-IronPort-AV: E=Sophos;i="5.64,489,1559545200"; 
   d="scan'208";a="178624836"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 10 Sep 2019 02:43:29 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 411A820A0F; Tue, 10 Sep 2019 12:43:27 +0300 (EEST)
Date:   Tue, 10 Sep 2019 12:43:27 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Luca Ceresoli <luca@lucaceresoli.net>
Cc:     linux-media@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Peter Rosin <peda@axentia.se>
Subject: Re: [RFC,v2 3/6] media: dt-bindings: add DS90UB954-Q1 video
 deserializer
Message-ID: <20190910094327.GG5781@paasikivi.fi.intel.com>
References: <20190723203723.11730-1-luca@lucaceresoli.net>
 <20190723203723.11730-4-luca@lucaceresoli.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190723203723.11730-4-luca@lucaceresoli.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Luca,

On Tue, Jul 23, 2019 at 10:37:20PM +0200, Luca Ceresoli wrote:

...

> +Device node example
> +-------------------
> +
> +&i2c0 {
> +	deser: deser@3d {
> +		compatible = "ti,ds90ub954-q1";
> +		reg-names = "main", "rxport0", "rxport1", "ser0", "ser1";
> +		reg       = <0x3d>,  <0x40>,    <0x41>,   <0x44>, <0x45>;
> +		clocks = <&clk_25M>;
> +		interrupt-parent = <&gic>;
> +		interrupts = <3 1 IRQ_TYPE_LEVEL_HIGH>;
> +		reset-gpios = <&gpio_ctl 4 GPIO_ACTIVE_LOW>;
> +
> +		i2c-alias-pool = /bits/ 16 <0x4a 0x4b 0x4c 0x4d 0x4e 0x4f>;
> +
> +		gpio-controller;
> +		#gpio-cells = <3>; /* rxport, remote gpio num, flags */
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +				ds90ub954_fpd3_in0: endpoint {
> +					remote-endpoint = <&sensor_0_out>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +				ds90ub954_fpd3_in1: endpoint {
> +					remote-endpoint = <&sensor_1_out>;
> +				};
> +			};
> +
> +			port@2 {
> +				reg = <2>;
> +				ds90ub954_mipi_out0: endpoint {
> +					data-lanes = <1 2 3 4>;
> +					/* Actually a REFCLK multiplier */
> +					data-rate = <1600000000>;

What is data-rate used for? Is it documented somewhere? Could you use
link-frequencies property instead? It's defined in video-interfaces.txt.

-- 
Sakari Ailus
sakari.ailus@linux.intel.com
