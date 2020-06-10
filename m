Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 054AE1F530E
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jun 2020 13:23:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728338AbgFJLXH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 10 Jun 2020 07:23:07 -0400
Received: from retiisi.org.uk ([95.216.213.190]:53702 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728322AbgFJLXH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 10 Jun 2020 07:23:07 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 466B8634C87;
        Wed, 10 Jun 2020 14:23:04 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1jiyox-0000ED-RI; Wed, 10 Jun 2020 14:23:03 +0300
Date:   Wed, 10 Jun 2020 14:23:03 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Sowjanya Komatineni <skomatineni@nvidia.com>
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        hverkuil@xs4all.nl, robh+dt@kernel.org, helen.koike@collabora.com,
        digetx@gmail.com, sboyd@kernel.org, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
Subject: Re: [RFC PATCH v1 10/18] dt-bindings: tegra: Document VI and CSI
 port nodes
Message-ID: <20200610112303.GB805@valkosipuli.retiisi.org.uk>
References: <1591768960-31648-1-git-send-email-skomatineni@nvidia.com>
 <1591768960-31648-11-git-send-email-skomatineni@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1591768960-31648-11-git-send-email-skomatineni@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Sowjanya,

Thanks for the patchset.

On Tue, Jun 09, 2020 at 11:02:32PM -0700, Sowjanya Komatineni wrote:
> This patch documents Tegra VI and CSI port and endpoint nodes along
> with the other required properties.
> 
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  .../display/tegra/nvidia,tegra20-host1x.txt        | 87 ++++++++++++++++++++++
>  1 file changed, 87 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
> index 4731921..f70a838 100644
> --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
> @@ -65,6 +65,48 @@ of the following host1x client modules:
>        - power-domains: Must include sor powergate node as csicil is in
>          SOR partition.
>  
> +      Optional properties for csi node:

What hardware does the csi node represent? A CSI-2 receiver? Something
else?

If you have two connections, you need two ports. The example isn't quite
clear on this; it would appear to represent a single physical interface.

> +
> +      - channel nodes: Max upto 6 channels/streams are supported with each CSI
> +	brick can as either x4 or x2 based on hw connectivity to sensor.
> +
> +	Required properties:
> +	- reg: channel/stream index
> +	- nvidia,mipi-calibrate: Should contain a phandle and a specifier
> +	  specifying which pads are used by this CSI port and need to be
> +	  calibrated. See also ../display/tegra/nvidia,tegra114-mipi.txt.
> +
> +	- port: CSI port node and its endpoint nodes as per device graph
> +          bindings defined in Documentation/devicetree/bindings/graph.txt.
> +	  Required properties:

You have both properties and nodes here. Same for the above (port is a
node).

> +	  - reg: csi port index based on hw csi lanes connectivity to the
> +	    sensor.
> +	  - bus-width: number of lanes used by this port. Supported lanes
> +	    are 1/2/4.

bus-width belongs to the endpoint. Note that this is for parallel busses
only. If you need the number of lanes, the property is called data-lanes.

> +	  - endpoint@0: sink node
> +	    Required properties:
> +	    - reg: endpoint id. This is used to retrieve pad for creating
> +	      media link
> +	    - remote-endpoint: phandle to sensor endpoint
> +	  - endpoint@1: source node
> +	    - reg: endpoint id. This is used to retrieve pad for creating
> +	      media link
> +	    - remote-endpoint: phandle to vi port endpoint
> +
> +  Optional properties for vi node:
> +  - ports: Video port nodes and endpoint nodes as per device graph bindings
> +    defined in Documentation/devicetree/bindings/graph.txt
> +    Max 6 ports are supported and each port should have one endpoint node.
> +
> +    Required properties:
> +    - port: VI port node and its sink endpoint node
> +      Required properties:
> +    - reg: should match port index
> +    - endpoint@0: sink node
> +      Required properties:
> +      - reg: endpoint id must be 0
> +      - remote-endpoint: phandle to CSI endpoint node.
> +
>  - epp: encoder pre-processor
>  
>    Required properties:
> @@ -340,6 +382,22 @@ Example:
>  
>  			ranges = <0x0 0x0 0x54080000 0x2000>;
>  
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					imx219_vi_in0: endpoint@0 {
> +						reg = <0>;
> +						remote-endpoint = <&imx219_csi_out0>;
> +					};
> +				};
> +			};
> +
>  			csi@838 {
>  				compatible = "nvidia,tegra210-csi";
>  				reg = <0x838 0x1300>;
> @@ -362,6 +420,35 @@ Example:
>  					 <&tegra_car TEGRA210_CLK_CSI_TPG>;
>  				clock-names = "csi", "cilab", "cilcd", "cile", "csi_tpg";
>  				power-domains = <&pd_sor>;
> +
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				channel@0 {
> +					reg = <0>;
> +					nvidia,mipi-calibrate = <&mipi 0x001>;
> +
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +						bus-width = <2>;
> +
> +						#address-cells = <1>;
> +						#size-cells = <0>;
> +
> +						imx219_csi_in0: endpoint@0 {
> +							reg = <0>;
> +							remote-endpoint = <&imx219_out0>;
> +						};
> +
> +						imx219_csi_out0: endpoint@1 {
> +							reg = <1>;
> +							remote-endpoint = <&imx219_vi_in0>;
> +						};
> +					};
> +				};
>  			};
>  		};
>  

-- 
Kind regards,

Sakari Ailus
