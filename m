Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 290F71AACFA
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Apr 2020 18:09:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729190AbgDOQIF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Apr 2020 12:08:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2406894AbgDOQIC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 15 Apr 2020 12:08:02 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33F76C061A0C;
        Wed, 15 Apr 2020 09:08:01 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id h11so157933plr.11;
        Wed, 15 Apr 2020 09:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=RY+VO0/vpBKvGZZg/yALfnK+LWYtJeI8ZBtWPOM+2hQ=;
        b=BxkqQRrCDxEs5BK9cx0OrPpukQgYyONH0rENg7DX6KVMV7F+7ig3KXZunKj2urACPl
         okT1I2TiCGXFRnOcJY61WZDgGwAdZ03e6qDqjUch6sszRMKF7QbD7JsT8YkySmKdtv0q
         R44onnvZ0L5JD+p78sY0ZG1YC7PWVdwJj2ACFDXuKm8IiEv6gHCfD950bngBzY5dZGum
         Ikr+8oKsmUi2WmTc1dp7LjnnuU1e4V+Vd9ZkDihj3AxQfGuNIMojcy6OVHkO5Ymvp8Lv
         gHLMtp9RDTK8POy5H4P26U4V4jj1FdpZCsSGpklYC1+JiSBOq4+t4buXwr0+KqhA/XZj
         t3zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=RY+VO0/vpBKvGZZg/yALfnK+LWYtJeI8ZBtWPOM+2hQ=;
        b=niVmjbW3gLIQXk+HLINaRT4Z7TLvebRBD55ZM3q/c4+TOz6zFlc/l/9HOEdYNvJZ0i
         pwDxVrfbsYnZZgtNAu8XsEu9QJmapNZ7dEySNMREn3YNGlSOtlG5EjJQl0esajhsY/2S
         IA/IAvkzOLcNLMZ27DWCIk8rCZhhe4Pw0hrTupS1fdAlEUlI2RxmwzuAGmMe6L5qrRER
         y8tPHNpdRRShlj5nJMnW1w6U3DFXWa+jFqBxC1CgfSA6aBwzpFLDSq0svmCPYa2CJpkc
         C2dQofKePZ/BbRmNKOnffHMilwp8FKtUz7cLf8Mss3zvwEtH+tH4M+GGhKkCfnX36xUE
         4z7Q==
X-Gm-Message-State: AGi0Pua44NYd+WbD+Phi6bNoz1jtfjlXGNCewfEaV1QjG7dfyIfniXSx
        0D4MmUJvL/eRXdqAqnO7WVI=
X-Google-Smtp-Source: APiQypJXNAoQQsO32DWsS6IBTWvebYMrF983N5CkHNR0wOi2cvMtx1u2I8RVszffWbrI/R9wRYan9Q==
X-Received: by 2002:a17:90a:f00b:: with SMTP id bt11mr7144748pjb.71.1586966880751;
        Wed, 15 Apr 2020 09:08:00 -0700 (PDT)
Received: from localhost (89.208.244.140.16clouds.com. [89.208.244.140])
        by smtp.gmail.com with ESMTPSA id x63sm5912909pfx.122.2020.04.15.09.07.59
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Apr 2020 09:08:00 -0700 (PDT)
Date:   Thu, 16 Apr 2020 00:07:57 +0800
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     michal.simek@xilinx.com, wsa+renesas@sang-engineering.com,
        pierre-yves.mordret@st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, alain.volmat@st.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] i2c: busses: convert to
 devm_platform_get_and_ioremap_resource
Message-ID: <20200415160757.GC17519@nuc8i5>
References: <20200414134827.18674-1-zhengdejin5@gmail.com>
 <20200415102158.GH1141@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200415102158.GH1141@ninjato>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Apr 15, 2020 at 12:21:58PM +0200, Wolfram Sang wrote:
> On Tue, Apr 14, 2020 at 09:48:27PM +0800, Dejin Zheng wrote:
> > use devm_platform_get_and_ioremap_resource() to simplify code, which
> > contains platform_get_resource() and devm_ioremap_resource(), it also
> > get the resource for use by the following code.
> > 
> > Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
> 
> Applied to for-next, because it seems 'the new way' but...
> 
> > -	r_mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > -	id->membase = devm_ioremap_resource(&pdev->dev, r_mem);
> > +	id->membase = devm_platform_get_and_ioremap_resource(pdev, 0, &r_mem);
> 
> ... guys, do you really think this one line reduction improves
> readability? Oh well...
>
Wolfram, Thank you for accepting it. From my personal point of view,
as long as the direction is correct, even small improvements are
worth doing. Thanks again for your tolerance.

BR,
Dejin


