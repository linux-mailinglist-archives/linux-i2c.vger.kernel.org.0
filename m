Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 632F91F577E
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jun 2020 17:15:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730099AbgFJPPV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 10 Jun 2020 11:15:21 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:7884 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726979AbgFJPPV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 10 Jun 2020 11:15:21 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ee0f8db0001>; Wed, 10 Jun 2020 08:14:35 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 10 Jun 2020 08:15:20 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 10 Jun 2020 08:15:20 -0700
Received: from [10.2.167.70] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 10 Jun
 2020 15:15:20 +0000
Subject: Re: [RFC PATCH v1 10/18] dt-bindings: tegra: Document VI and CSI port
 nodes
To:     Sakari Ailus <sakari.ailus@iki.fi>
CC:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <frankc@nvidia.com>, <hverkuil@xs4all.nl>, <robh+dt@kernel.org>,
        <helen.koike@collabora.com>, <digetx@gmail.com>,
        <sboyd@kernel.org>, <gregkh@linuxfoundation.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>
References: <1591768960-31648-1-git-send-email-skomatineni@nvidia.com>
 <1591768960-31648-11-git-send-email-skomatineni@nvidia.com>
 <20200610112303.GB805@valkosipuli.retiisi.org.uk>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <075d9d2e-eaa8-1895-8759-64c682fee1c4@nvidia.com>
Date:   Wed, 10 Jun 2020 08:15:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200610112303.GB805@valkosipuli.retiisi.org.uk>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1591802075; bh=kk+QMVEOjc1lV2kCwKPqvUooZW7O6ZM/dk+n2Vpww1I=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=MFkqUeanNXj7YJ7FGzM7DBn4AJjXWtgazzXgRA784zPBzaxM2ulHOtMFGOurpOhnM
         EwmxTSdIVlQ3yPEwfa0y7DCw9KSpQ5FzHYasTOo8hzAbuuundwbAlvWXXX9jEZdjtP
         a8PexiFY8BSuWapSjGFDvV5AI1sqP21VrNjJWAm7Ni7D1EYlOir36PJuVf34Wtae/b
         AdpQXFrlmZAJtwNKlVFTvqH/J/1qR2xplPdUz0v/r1q/b66WPew8Oh+ZrmYkmQfwCw
         PwS7xtU3t2s7mGlYs/dKXz7+8IoEeY+B7qYVLJd0lO3J7rtLMC202JPFeviJTW7v6G
         Q/01ljPFErdPQ==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 6/10/20 4:23 AM, Sakari Ailus wrote:
> Hi Sowjanya,
>
> Thanks for the patchset.
>
> On Tue, Jun 09, 2020 at 11:02:32PM -0700, Sowjanya Komatineni wrote:
>> This patch documents Tegra VI and CSI port and endpoint nodes along
>> with the other required properties.
>>
>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>> ---
>>   .../display/tegra/nvidia,tegra20-host1x.txt        | 87 ++++++++++++++++++++++
>>   1 file changed, 87 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
>> index 4731921..f70a838 100644
>> --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
>> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
>> @@ -65,6 +65,48 @@ of the following host1x client modules:
>>         - power-domains: Must include sor powergate node as csicil is in
>>           SOR partition.
>>   
>> +      Optional properties for csi node:
> What hardware does the csi node represent? A CSI-2 receiver? Something
> else?
>
> If you have two connections, you need two ports. The example isn't quite
> clear on this; it would appear to represent a single physical interface.

CS-2 receiver with 2 connections. one for sink with sensor to csi and 
other as source with csi to Tegra vi.

Was using separate port for sink and source and then I misunderstood 
device graph document and changed to have multiple endpoints in same port.

Will update this in v2 to have separate port for each sink and source 
endpoint in csi in dt and also in driver implementation.

>> +
>> +      - channel nodes: Max upto 6 channels/streams are supported with each CSI
>> +	brick can as either x4 or x2 based on hw connectivity to sensor.
>> +
>> +	Required properties:
>> +	- reg: channel/stream index
>> +	- nvidia,mipi-calibrate: Should contain a phandle and a specifier
>> +	  specifying which pads are used by this CSI port and need to be
>> +	  calibrated. See also ../display/tegra/nvidia,tegra114-mipi.txt.
>> +
>> +	- port: CSI port node and its endpoint nodes as per device graph
>> +          bindings defined in Documentation/devicetree/bindings/graph.txt.
>> +	  Required properties:
> You have both properties and nodes here. Same for the above (port is a
> node).
Will update document to separate out port node from properties
>
>> +	  - reg: csi port index based on hw csi lanes connectivity to the
>> +	    sensor.
>> +	  - bus-width: number of lanes used by this port. Supported lanes
>> +	    are 1/2/4.
> bus-width belongs to the endpoint. Note that this is for parallel busses
> only. If you need the number of lanes, the property is called data-lanes.
Will update in v2 for having separate ports for sink and source 
endpoints will move bus-width to endpoint.
>
>> +	  - endpoint@0: sink node
>> +	    Required properties:
>> +	    - reg: endpoint id. This is used to retrieve pad for creating
>> +	      media link
>> +	    - remote-endpoint: phandle to sensor endpoint
>> +	  - endpoint@1: source node
>> +	    - reg: endpoint id. This is used to retrieve pad for creating
>> +	      media link
>> +	    - remote-endpoint: phandle to vi port endpoint
>> +
>> +  Optional properties for vi node:
>> +  - ports: Video port nodes and endpoint nodes as per device graph bindings
>> +    defined in Documentation/devicetree/bindings/graph.txt
>> +    Max 6 ports are supported and each port should have one endpoint node.
>> +
>> +    Required properties:
>> +    - port: VI port node and its sink endpoint node
>> +      Required properties:
>> +    - reg: should match port index
>> +    - endpoint@0: sink node
>> +      Required properties:
>> +      - reg: endpoint id must be 0
>> +      - remote-endpoint: phandle to CSI endpoint node.
>> +
>>   - epp: encoder pre-processor
>>   
>>     Required properties:
>> @@ -340,6 +382,22 @@ Example:
>>   
>>   			ranges = <0x0 0x0 0x54080000 0x2000>;
>>   
>> +			ports {
>> +				#address-cells = <1>;
>> +				#size-cells = <0>;
>> +
>> +				port@0 {
>> +					reg = <0>;
>> +					#address-cells = <1>;
>> +					#size-cells = <0>;
>> +
>> +					imx219_vi_in0: endpoint@0 {
>> +						reg = <0>;
>> +						remote-endpoint = <&imx219_csi_out0>;
>> +					};
>> +				};
>> +			};
>> +
>>   			csi@838 {
>>   				compatible = "nvidia,tegra210-csi";
>>   				reg = <0x838 0x1300>;
>> @@ -362,6 +420,35 @@ Example:
>>   					 <&tegra_car TEGRA210_CLK_CSI_TPG>;
>>   				clock-names = "csi", "cilab", "cilcd", "cile", "csi_tpg";
>>   				power-domains = <&pd_sor>;
>> +
>> +				#address-cells = <1>;
>> +				#size-cells = <0>;
>> +
>> +				channel@0 {
>> +					reg = <0>;
>> +					nvidia,mipi-calibrate = <&mipi 0x001>;
>> +
>> +					#address-cells = <1>;
>> +					#size-cells = <0>;
>> +
>> +					port@0 {
>> +						reg = <0>;
>> +						bus-width = <2>;
>> +
>> +						#address-cells = <1>;
>> +						#size-cells = <0>;
>> +
>> +						imx219_csi_in0: endpoint@0 {
>> +							reg = <0>;
>> +							remote-endpoint = <&imx219_out0>;
>> +						};
>> +
>> +						imx219_csi_out0: endpoint@1 {
>> +							reg = <1>;
>> +							remote-endpoint = <&imx219_vi_in0>;
>> +						};
>> +					};
>> +				};
>>   			};
>>   		};
>>   
