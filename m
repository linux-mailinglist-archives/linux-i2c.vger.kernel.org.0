Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F3F738B848
	for <lists+linux-i2c@lfdr.de>; Thu, 20 May 2021 22:21:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234810AbhETUXD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 May 2021 16:23:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233491AbhETUXC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 May 2021 16:23:02 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BF8EC061574;
        Thu, 20 May 2021 13:21:40 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id z12so25799551ejw.0;
        Thu, 20 May 2021 13:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
         :user-agent:mime-version;
        bh=gj6HxIbz15inQkT3Nj+fjyjwArJruqAZA723Ulizlqw=;
        b=cQgXNYSAohE4c8rIm8/VBR6j/zfMfuEf/h/FWAxhg/gl/jqEi+50X2c8DN+2UNTJZE
         uDDlZNlTU4yLq9ncmddAippZoCrrOA4JWVKZs7h0Gp8jvt6viT41p7dTiDlI4pnSHJ3V
         MeGWVNU5hpaoM+5GrYF+OZ+ZxW7h+H+fCJWtAgfH7X/nxDF1tlync/v4p3WnYWdOAg9O
         D1/evxW2s9kuELppxD2KjXkrTFJzYSUdSKQs8y6nP3r1L4PuAPkZ7m/vHfd9PCqBFgro
         z3D1dcwcIEnKokf+FTJ9JEkFHbrJqadPUtMGAasWC0nLDP16HpnGLfS8/fzktLPKGL/o
         ICBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:references:date
         :in-reply-to:message-id:user-agent:mime-version;
        bh=gj6HxIbz15inQkT3Nj+fjyjwArJruqAZA723Ulizlqw=;
        b=c+/B7HWuIho0P44s0fWrayPoOZxhlhDbiPdnR5GTQr5azPVArWrzHROwNwv9hx+Ndd
         e2TrGUvN3W2y8HqITeqnxf3CfEjLrTqlzzwAEp8uGKHxFQpuux1AsqPudIKQh8RgObXQ
         MdKeeQwnKSaNpp6jdWrfkLeNTjL+mbt5sRftxuzBL/Ol49Rq2qEP/xmlIzgUy6uPcbGh
         EZ+QARl98YljNHstjyXRzKgYZcXcKEUA16MdatpKx28eD5OHfdCgaCXQBwEt6WRRrFCF
         cF89tXNtrpqCnO0AQHA/cxgzdQYMcVS6sGnyjmh6bTjfGbZcHUiRp7w3ZUMmteQxwg+V
         sj4A==
X-Gm-Message-State: AOAM5330KPsmw5JcrydFIU6baju5debTnfWgy1PipHRN4eX56Xt4Zi8a
        cnv8gNu1vCfaQbfCdhoREG/tK64vFbqP4A==
X-Google-Smtp-Source: ABdhPJwoEXiLY0CmtQlqxtzxp5h8vnCy2Q12h8grAgCuCty6keJH1wflPoKN4KuBNPZdlzE+Z5SN4w==
X-Received: by 2002:a17:906:2854:: with SMTP id s20mr6336510ejc.335.1621542098666;
        Thu, 20 May 2021 13:21:38 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
        by smtp.gmail.com with ESMTPSA id qo14sm2012776ejb.47.2021.05.20.13.21.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 13:21:37 -0700 (PDT)
Sender: Peter Korsgaard <jacmet@gmail.com>
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
        (envelope-from <peter@korsgaard.com>)
        id 1ljpAm-0008J6-MG; Thu, 20 May 2021 22:21:36 +0200
From:   Peter Korsgaard <peter@korsgaard.com>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Andreas Larsson <andreas@gaisler.com>,
        linux-i2c@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 10/16] i2c: busses: i2c-ocores: Place the expected function names into the documentation headers
References: <20210520190105.3772683-1-lee.jones@linaro.org>
        <20210520190105.3772683-11-lee.jones@linaro.org>
Date:   Thu, 20 May 2021 22:21:36 +0200
In-Reply-To: <20210520190105.3772683-11-lee.jones@linaro.org> (Lee Jones's
        message of "Thu, 20 May 2021 20:00:59 +0100")
Message-ID: <878s4988bz.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

>>>>> "Lee" == Lee Jones <lee.jones@linaro.org> writes:

 > Fixes the following W=1 kernel build warning(s):
 >  drivers/i2c/busses/i2c-ocores.c:253: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 >  drivers/i2c/busses/i2c-ocores.c:267: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 >  drivers/i2c/busses/i2c-ocores.c:299: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 >  drivers/i2c/busses/i2c-ocores.c:347: warning: expecting prototype for It handles an IRQ(). Prototype was for ocores_process_polling() instead

 > Cc: Peter Korsgaard <peter@korsgaard.com>
 > Cc: Andrew Lunn <andrew@lunn.ch>
 > Cc: Palmer Dabbelt <palmer@dabbelt.com>
 > Cc: Paul Walmsley <paul.walmsley@sifive.com>
 > Cc: Andreas Larsson <andreas@gaisler.com>
 > Cc: linux-i2c@vger.kernel.org
 > Cc: linux-riscv@lists.infradead.org
 > Signed-off-by: Lee Jones <lee.jones@linaro.org>

Reviewed-by: Peter Korsgaard <peter@korsgaard.com>

-- 
Bye, Peter Korsgaard
