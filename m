Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85855569592
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Jul 2022 01:01:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233533AbiGFXBY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 Jul 2022 19:01:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229768AbiGFXBX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 6 Jul 2022 19:01:23 -0400
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E71A1C12F;
        Wed,  6 Jul 2022 16:01:22 -0700 (PDT)
Received: by mail-ot1-f41.google.com with SMTP id 7-20020a9d0107000000b00616935dd045so12840683otu.6;
        Wed, 06 Jul 2022 16:01:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rpwT695sri6PiwsIkplM0soIt4K0mTDGGLf39HX2spg=;
        b=lNyqBye5TUrmVc25uQEzrqVcglIdDbtya0SJHAolFQI3/jGaesHEKvaJU9ThVZSws9
         X+/nK8t7WVLGo3k/C6bciAPwi42GjAQC/tlGkVdRRJgQ0IF9JCuICL6tQ4IQ13iNxyrB
         rvRg7MtsUnd1S+ny0eIMuZ75ijtki01vBMjwNqUEek7Mgz2cppWO8FlUV4Qa3nyPuAmq
         2/uqxxe7Xyrs5UMkpTdjBeymYkWvT5D7J/D7LkJ8qa2W7CU2SJQeXlaiwwReZGNwIJbb
         lgTzZeBCdwXPnkOnlvceJeVhlBPIZNNOjfN4cyXRU2cUpu3zS88TYSKmnsuHA6O9J6x7
         Ja0w==
X-Gm-Message-State: AJIora8mrLvPkis6jkcktVnYP2oY0Me7f8IqSqCPv9DcMJbYikMe0Lmp
        FAnhmqerNZVsFGAo9pu7EA0fUnAklQ==
X-Google-Smtp-Source: AGRyM1sZ6SEM/+/Qq2SjdTe5pzaMC4OLV2H6/yij1GibQKAOaL4bQj6xoE8l6Oe89u5hgaHGcDS/tQ==
X-Received: by 2002:a9d:7646:0:b0:616:c17c:7d26 with SMTP id o6-20020a9d7646000000b00616c17c7d26mr19384810otl.83.1657148481842;
        Wed, 06 Jul 2022 16:01:21 -0700 (PDT)
Received: from robh.at.kernel.org ([2607:fb90:5fe0:199f:283a:d3be:fc5c:70cd])
        by smtp.gmail.com with ESMTPSA id v39-20020a05687070a700b0010c3b371098sm25324oae.27.2022.07.06.16.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 16:01:21 -0700 (PDT)
Received: (nullmailer pid 673503 invoked by uid 1000);
        Wed, 06 Jul 2022 22:46:13 -0000
Date:   Wed, 6 Jul 2022 16:46:13 -0600
From:   Rob Herring <robh@kernel.org>
To:     Wolfram Sang <wsa@kernel.org>,
        Alain Volmat <alain.volmat@foss.st.com>, mark.rutland@arm.com,
        pierre-yves.mordret@foss.st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@foss.st.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        fabrice.gasnier@foss.st.com, amelie.delaunay@foss.st.com
Subject: Re: [PATCH 1/4] dt-bindings: i2c: st,stm32-i2c: don't mandate a
 reset line
Message-ID: <20220706224613.GD572635-robh@kernel.org>
References: <20220620105405.145959-1-alain.volmat@foss.st.com>
 <20220620105405.145959-2-alain.volmat@foss.st.com>
 <20220628134115.GA345270-robh@kernel.org>
 <YryrpbBKsAKcL865@shikoro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YryrpbBKsAKcL865@shikoro>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jun 29, 2022 at 09:44:37PM +0200, Wolfram Sang wrote:
> On Tue, Jun 28, 2022 at 07:41:15AM -0600, Rob Herring wrote:
> > On Mon, Jun 20, 2022 at 12:54:02PM +0200, Alain Volmat wrote:
> > > Update the dt-bindings of the i2c-stm32 drivers to avoid the
> > > needs for a reset property in the device-tree.
> > 
> > That is clear from the diff, but why. Some chips don't have a reset? 
> > If so, this should be combined with patch 2 as part of changes needed 
> > for a new version.
> 
> What do you mean? Patches 1+2 should be squashed together? I can do this
> when applying. Or do you mean something else?

Sorry, I meant combined with patch 3. If the new chip added in patch 3 
doesn't have a reset, then 1 and 3 should be 1 patch. IOW, all the 
changes needed for a new chip in 1 patch.

Rob
