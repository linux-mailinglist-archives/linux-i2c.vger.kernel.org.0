Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3868A6424A5
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Dec 2022 09:32:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232107AbiLEIcD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 5 Dec 2022 03:32:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232109AbiLEIbx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 5 Dec 2022 03:31:53 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF7FF165AC;
        Mon,  5 Dec 2022 00:31:52 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7807B60F98;
        Mon,  5 Dec 2022 08:31:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A5B9C433C1;
        Mon,  5 Dec 2022 08:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670229111;
        bh=gGSFOcfNvIV7dfWy0rhiZJ0qWM2tN+SZKzTXbj86API=;
        h=Date:From:To:Subject:References:In-Reply-To:From;
        b=VwIKVCG/B7HF4RtURKTESKI/7meSx5I98Km8CZ+IVlqr6g4CJEd20ZyPf3yFcXllC
         oMJlZ4HTMdai9xjxHVnhT4e1Hj28r/1vjv6lz+iOaGcwzXTqP/kpS6k6DWEDFAn5TL
         zDCpT/XqXh6nT/DY4JOsP+OK82Sy6YkjnFpC2aof4GFeE1vGrWpZISbQNeiOu2Zw94
         PKAhzKu2nw1oKXXwXrjWxT610MYb/2tdS16853Ilao9MYWu1OHrg0Oa3EwJeZR/Rna
         IWLH6KefPWqc0ArcoYdOPZXPhrvMTS9dTo4soVMzCjPImb2trs4pppArzkCbVcZrp+
         sYqqUuLCIKWxw==
Date:   Mon, 5 Dec 2022 09:31:49 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/6] soc: qcom: add support for the I2C Master Hub
Message-ID: <Y42sdXiCIpj2iaag@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221114-narmstrong-sm8550-upstream-i2c-master-hub-v3-0-f6a20dc9996e@linaro.org>
 <Y4kvcXTdwImZpaU1@shikoro>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="degf3DG1u90+YJbA"
Content-Disposition: inline
In-Reply-To: <Y4kvcXTdwImZpaU1@shikoro>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--degf3DG1u90+YJbA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 01, 2022 at 11:49:21PM +0100, Wolfram Sang wrote:
> On Tue, Nov 29, 2022 at 03:47:00PM +0100, Neil Armstrong wrote:
> > The I2C Master Hub is a stripped down version of the GENI Serial Engine
> > QUP Wrapper Controller but only supporting I2C serial engines without
> > DMA support.
> >=20
> > The I2C Master Hub only supports a variant of the I2C serial engine wit=
h:
> > - a separate "core" clock
> > - no DMA support
> > - non discoverable fixed FIFO size
> >=20
> > Since DMA isn't supported, the wrapper doesn't need the Master AHB clock
> > and the iommus property neither.
> >=20
> > This patchset adds the bindings changes to the QUPv3 wrapper and I2C se=
rial
> > element bindings to reflect the different resources requirements.
> >=20
> > In order to reuse the QUPv3 wrapper and I2C serial element driver suppo=
rt,
> > the I2C Master Hub requirements are expressed in new desc structs passed
> > as device match data.
>=20
> Is everyone fine if I take all this via the I2C tree?

I did this now.

All applied to for-next, thanks!


--degf3DG1u90+YJbA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmONrHEACgkQFA3kzBSg
KbYwTw/8CFbsKahOCnxRWkz2eWDHdMItDVRlO7LmZc4fIQFl2pDH9iJ3otVoI7wf
SaD2xUd3pnIAg3Ji0a6RibgTLTmqnEIS+XWdjtcuYlNAiN6jbJi/WZFLU0mPXrjh
MJpC3++LlvkMB8vrR/rUuTZK/sPqzToNyD413FsQIh7vmyrO1DKEyRMgW6kVvT5f
NiJHZMXirCHH5+KnKi+078gfu33untxT9m+Aqv7g3IUl9epkmgKk0mDNtQIbg5kD
ogeyhfsidUTLk1ySvnpGW+TvvvYSTX6teJHwoDy54ua2eZkWxfKDbpAa2M8VSbbo
q0zWrswOmN1S6MnDBor2oRZQdKNyWoZliO2co4S+nZiDg2iDMctfHJZbE6ePs/eX
qXqs2c6DSXvdaKN8HajybpX2gxED+QAXGgRcTFaVKIxVkETjydDUSl28mAMR/4tP
UXPhOhWF0G/B6lpxj7n38KOMUUup9MBMzyhED/dM0Rg0nQPnRJL6uSLtFvRS7QCL
aWTgU5sehJV4ABIxkOQYU+SjuWNwlG/VnFr/ufLVJLNV+pzgGRi9bM3icrKiHSbV
epCatGPUfnXw3svjTNd1OGcwIhm9YtEPZzN+UxnA4dVl69mJxVpbF1ud34c/E2YB
TD6KnQMhlqPpSskAUmkbgKFZztGlZqy6TWdFJtqLWd9+jUjcLZ0=
=6Gcb
-----END PGP SIGNATURE-----

--degf3DG1u90+YJbA--
