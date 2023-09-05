Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55DB8793089
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Sep 2023 22:58:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237380AbjIEU6E (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 Sep 2023 16:58:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238667AbjIEU6D (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 5 Sep 2023 16:58:03 -0400
X-Greylist: delayed 206 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 05 Sep 2023 13:57:59 PDT
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB92B137;
        Tue,  5 Sep 2023 13:57:59 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AAE2C433CB;
        Tue,  5 Sep 2023 20:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693947272;
        bh=2byUuBnNYOniARqS3P7QGkHGois1QxSUoeI8B8+N+CI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SVCOXQmRG4GMVnAt1C5TAdvwIgBnmUiz0mEeLLqjDLNkof5WT+6qaBcZIcSGah/KG
         Y9M3ZTwgd+unKGgAMf7XD8vN9syyJ3oHV29s6N+gyGyRDxNLAgvA/6jeSXTT15XcWk
         qeKMOOtvirOKQjf99Q/b2gNlIwO/NZxGpSmpPk7GeAcvyupjCJz77GiJDvJjOXdHDX
         UbR3JPFbbW+1NpqUTJbk2pAziwQjrUDdIfPCooF7VtHM4JgC01hKhMMeHnYPvAXR8h
         BcQ3L/rcH9I6moyVff22z0rlf7LoK9jWPPzbq81Ex1HSpwZUdl0+LAou5HU3L7ebZW
         XbENyMKD64qPA==
Received: (nullmailer pid 3998225 invoked by uid 1000);
        Tue, 05 Sep 2023 20:54:30 -0000
Date:   Tue, 5 Sep 2023 15:54:30 -0500
From:   Rob Herring <robh@kernel.org>
To:     Rob Herring <robh@kernel.org>
Cc:     devicetree@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        linux-arm-msm@vger.kernel.org, Todor Tomov <todor.too@gmail.com>,
        linux-media@vger.kernel.org, Robert Foss <rfoss@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-kernel@vger.kernel.org,
        Conor Dooley <conor.dooley@microchip.com>,
        linux-i2c@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH v2] media: dt-bindings: Convert Omnivision OV7251 to DT
 schema
Message-ID: <169394726845.3998146.13277420411193366338.robh@kernel.org>
References: <20230817202713.2180195-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230817202713.2180195-1-robh@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On Thu, 17 Aug 2023 15:27:13 -0500, Rob Herring wrote:
> Convert the OmniVision OV7251 Image Sensor binding to DT schema format.
> 
> vddd-supply was listed as required, but the example and actual user
> don't have it. Also, the data brief says it has an internal regulator,
> so perhaps it is truly optional.
> 
> Add missing common "link-frequencies" which is used and required by the
> Linux driver.
> 
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> v2:
>  - Add link-frequencies which the driver requires
> ---
>  .../devicetree/bindings/i2c/qcom,i2c-cci.yaml |   1 +
>  .../devicetree/bindings/media/i2c/ov7251.txt  |  52 ---------
>  .../bindings/media/i2c/ovti,ov7251.yaml       | 109 ++++++++++++++++++
>  3 files changed, 110 insertions(+), 52 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/i2c/ov7251.txt
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov7251.yaml
> 

Applied, thanks!

