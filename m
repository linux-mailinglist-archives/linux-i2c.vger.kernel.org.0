Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E18D1AEE0A
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2019 17:02:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732385AbfIJPCt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 Sep 2019 11:02:49 -0400
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:55027 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730222AbfIJPCt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 10 Sep 2019 11:02:49 -0400
Received: from [148.69.85.38] (port=20650 helo=[192.168.5.132])
        by hostingweb31.netsons.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.92)
        (envelope-from <luca@lucaceresoli.net>)
        id 1i7hfI-005t84-5V; Tue, 10 Sep 2019 17:02:44 +0200
Subject: Re: [RFC,v2 3/6] media: dt-bindings: add DS90UB954-Q1 video
 deserializer
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
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
References: <20190723203723.11730-1-luca@lucaceresoli.net>
 <20190723203723.11730-4-luca@lucaceresoli.net>
 <20190910094327.GG5781@paasikivi.fi.intel.com>
From:   Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <c977123c-3f4d-a3b1-f329-fa69dbc20040@lucaceresoli.net>
Date:   Tue, 10 Sep 2019 16:02:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190910094327.GG5781@paasikivi.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id: luca@lucaceresoli.net
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Sakari,

On 10/09/19 10:43, Sakari Ailus wrote:
> Hi Luca,
> 
> On Tue, Jul 23, 2019 at 10:37:20PM +0200, Luca Ceresoli wrote:
> 
> ...
> 
>> +Device node example
>> +-------------------
>> +
>> +&i2c0 {
>> +	deser: deser@3d {
>> +		compatible = "ti,ds90ub954-q1";
>> +		reg-names = "main", "rxport0", "rxport1", "ser0", "ser1";
>> +		reg       = <0x3d>,  <0x40>,    <0x41>,   <0x44>, <0x45>;
>> +		clocks = <&clk_25M>;
>> +		interrupt-parent = <&gic>;
>> +		interrupts = <3 1 IRQ_TYPE_LEVEL_HIGH>;
>> +		reset-gpios = <&gpio_ctl 4 GPIO_ACTIVE_LOW>;
>> +
>> +		i2c-alias-pool = /bits/ 16 <0x4a 0x4b 0x4c 0x4d 0x4e 0x4f>;
>> +
>> +		gpio-controller;
>> +		#gpio-cells = <3>; /* rxport, remote gpio num, flags */
>> +
>> +		ports {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +
>> +			port@0 {
>> +				reg = <0>;
>> +				ds90ub954_fpd3_in0: endpoint {
>> +					remote-endpoint = <&sensor_0_out>;
>> +				};
>> +			};
>> +
>> +			port@1 {
>> +				reg = <1>;
>> +				ds90ub954_fpd3_in1: endpoint {
>> +					remote-endpoint = <&sensor_1_out>;
>> +				};
>> +			};
>> +
>> +			port@2 {
>> +				reg = <2>;
>> +				ds90ub954_mipi_out0: endpoint {
>> +					data-lanes = <1 2 3 4>;
>> +					/* Actually a REFCLK multiplier */
>> +					data-rate = <1600000000>;
> 
> What is data-rate used for? Is it documented somewhere? Could you use
> link-frequencies property instead? It's defined in video-interfaces.txt.

Right, it should be link-frequencies. Thanks for pointing out.

-- 
Luca
