Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63509346AD6
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Mar 2021 22:11:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233476AbhCWVLI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Mar 2021 17:11:08 -0400
Received: from mail-io1-f49.google.com ([209.85.166.49]:38790 "EHLO
        mail-io1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233422AbhCWVKi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 23 Mar 2021 17:10:38 -0400
Received: by mail-io1-f49.google.com with SMTP id e8so19267466iok.5;
        Tue, 23 Mar 2021 14:10:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=d5v+QZ+m+eAEAjjKWBWtWNR+M9eFWkJnF+zMMFTSdC4=;
        b=Gen3eNakaN5R7nicASVX5ZTCNUFqxCbvZz3WouhBC8Y37lIfdSvxwIdUYYJldBVeUH
         WeCstPQYPDHYQV8fEE3HxxWjwC4XiAGFSMupT8wOLIAlL46MZt/UQEmsW0hnzS/icjH+
         FmpZ03tLr06c5rSNpFiaQGt7heJdXQ1t4OFZTB6F3d3s1vlm+SYAaRC8qMVcpwDvpIGa
         B/isSRwTn7jNzkqzo21bNy178AMcCIDLyh9u9sUJqz+pRbhtIGuBhO3S91e0Zo4mcL8I
         Wk4I6A6++gZZ3Y0BrMIHiJtsdaF0re2B4heAVG16J9HDRCrlkrU/FBX75SC7Ory4Flq7
         bq5A==
X-Gm-Message-State: AOAM531+VAoV/TtCX6cyJkRdEhTlJeXWzUTqCvBxsxqXaHmaY0JLhNaM
        5v99PKlGjmKzNvlrmZqUiCXu9J4inA==
X-Google-Smtp-Source: ABdhPJxT4j+C0gXVMrO6N6qd7p57V0ywq7ZBe3/M0oSPHIExCam+fvC++i2KrfSmw791jxXpQB8ujw==
X-Received: by 2002:a02:7119:: with SMTP id n25mr17271jac.48.1616533837693;
        Tue, 23 Mar 2021 14:10:37 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id q20sm23950ilj.56.2021.03.23.14.10.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 14:10:37 -0700 (PDT)
Received: (nullmailer pid 1329565 invoked by uid 1000);
        Tue, 23 Mar 2021 21:10:35 -0000
Date:   Tue, 23 Mar 2021 15:10:35 -0600
From:   Rob Herring <robh@kernel.org>
To:     Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "wsa@kernel.org" <wsa@kernel.org>,
        "jdelvare@suse.com" <jdelvare@suse.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH 2/6] dt-bindings: i2c: convert i2c-mpc to json-schema
Message-ID: <20210323211035.GA1326908@robh.at.kernel.org>
References: <20210323043331.21878-1-chris.packham@alliedtelesis.co.nz>
 <20210323043331.21878-3-chris.packham@alliedtelesis.co.nz>
 <1616530607.398955.1244764.nullmailer@robh.at.kernel.org>
 <f5e86696-07f1-f1d2-9596-af7fa6ae1cdd@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f5e86696-07f1-f1d2-9596-af7fa6ae1cdd@alliedtelesis.co.nz>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Mar 23, 2021 at 08:22:00PM +0000, Chris Packham wrote:
> Hi Rob,
> 
> On 24/03/21 9:16 am, Rob Herring wrote:
> > On Tue, 23 Mar 2021 17:33:27 +1300, Chris Packham wrote:
> >> Convert i2c-mpc to YAML.
> >>
> >> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> >> ---
> >>   .../devicetree/bindings/i2c/i2c-mpc.txt       | 62 ------------
> >>   .../devicetree/bindings/i2c/i2c-mpc.yaml      | 99 +++++++++++++++++++
> >>   2 files changed, 99 insertions(+), 62 deletions(-)
> >>   delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-mpc.txt
> >>   create mode 100644 Documentation/devicetree/bindings/i2c/i2c-mpc.yaml
> >>
> > My bot found errors running 'make dt_binding_check' on your patch:
> >
> > yamllint warnings/errors:
> > ./Documentation/devicetree/bindings/i2c/i2c-mpc.yaml:19:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
> > ./Documentation/devicetree/bindings/i2c/i2c-mpc.yaml:20:11: [warning] wrong indentation: expected 12 but found 10 (indentation)
> Hmm I did run 'make dt_binding_check' is yamllint run separately (or not 
> run if it's not installed?).

No and yes...

> > dtschema/dtc warnings/errors:
> >
> > See https://patchwork.ozlabs.org/patch/1457053
> >
> > This check can fail if there are any dependencies. The base for a patch
> > series is generally the most recent rc1.
> >
> > If you already ran 'make dt_binding_check' and didn't see the above
> > error(s), then make sure 'yamllint' is installed and dt-schema is up to
> > date:

^^^^^

> >
> > pip3 install dtschema --upgrade
> >
> > Please check and re-submit.
> Should be easy to fix the binding but I'll spend a bit of time trying to 
> get my tooling sorted.
