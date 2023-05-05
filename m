Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A3156F7AA3
	for <lists+linux-i2c@lfdr.de>; Fri,  5 May 2023 03:19:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229871AbjEEBTY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 4 May 2023 21:19:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbjEEBTY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 4 May 2023 21:19:24 -0400
Received: from hust.edu.cn (unknown [202.114.0.240])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1AFAA12494;
        Thu,  4 May 2023 18:19:21 -0700 (PDT)
Received: from d202180596$hust.edu.cn ( [10.12.189.15] ) by
 ajax-webmail-app2 (Coremail) ; Fri, 5 May 2023 09:18:16 +0800 (GMT+08:00)
X-Originating-IP: [10.12.189.15]
Date:   Fri, 5 May 2023 09:18:16 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From:   d202180596@hust.edu.cn
To:     "andy gross" <agross@kernel.org>,
        "bjorn andersson" <andersson@kernel.org>,
        "konrad dybcio" <konrad.dybcio@linaro.org>,
        "wolfram sang" <wsa@kernel.org>,
        "ivan t. ivanov" <iivanov@mm-sol.com>,
        "sricharan r" <sricharan@codeaurora.org>,
        "naveen kaje" <nkaje@codeaurora.org>,
        "austin christ" <austinwc@codeaurora.org>
Cc:     hust-os-kernel-patches@googlegroups.com,
        "andy gross" <agross@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: qup: Add missing unwind goto in qup_i2c_probe()
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20220802(cbd923c5)
 Copyright (c) 2002-2023 www.mailtech.cn hust
In-Reply-To: <20230418135612.598-1-d202180596@hust.edu.cn>
References: <20230418135612.598-1-d202180596@hust.edu.cn>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <5c9f1e4d.47382.187e97d01a5.Coremail.d202180596@hust.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: GQEQrADX4JVYWVRkMDEDBQ--.4113W
X-CM-SenderInfo: rgsqjiiyqvmlo6kx23oohg3hdfq/1tbiAQoCE17Em5bqRAAAsj
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
        CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
        daVFxhVjvjDU=
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Cj4gLS0tLS3ljp/lp4vpgq7ku7YtLS0tLQo+IOWPkeS7tuS6ujogIlNodWFpIEppYW5nIiA8ZDIw
MjE4MDU5NkBodXN0LmVkdS5jbj4KPiDlj5HpgIHml7bpl7Q6IDIwMjMtMDQtMTggMjE6NTY6MTIg
KOaYn+acn+S6jCkKPiDmlLbku7bkuro6ICJBbmR5IEdyb3NzIiA8YWdyb3NzQGtlcm5lbC5vcmc+
LCAiQmpvcm4gQW5kZXJzc29uIiA8YW5kZXJzc29uQGtlcm5lbC5vcmc+LCAiS29ucmFkIER5YmNp
byIgPGtvbnJhZC5keWJjaW9AbGluYXJvLm9yZz4sICJXb2xmcmFtIFNhbmciIDx3c2FAa2VybmVs
Lm9yZz4sICJJdmFuIFQuIEl2YW5vdiIgPGlpdmFub3ZAbW0tc29sLmNvbT4sICJTcmljaGFyYW4g
UiIgPHNyaWNoYXJhbkBjb2RlYXVyb3JhLm9yZz4sICJOYXZlZW4gS2FqZSIgPG5rYWplQGNvZGVh
dXJvcmEub3JnPiwgIkF1c3RpbiBDaHJpc3QiIDxhdXN0aW53Y0Bjb2RlYXVyb3JhLm9yZz4KPiDm
ioTpgIE6IGh1c3Qtb3Mta2VybmVsLXBhdGNoZXNAZ29vZ2xlZ3JvdXBzLmNvbSwgIlNodWFpIEpp
YW5nIiA8ZDIwMjE4MDU5NkBodXN0LmVkdS5jbj4sICJBbmR5IEdyb3NzIiA8YWdyb3NzQGNvZGVh
dXJvcmEub3JnPiwgbGludXgtYXJtLW1zbUB2Z2VyLmtlcm5lbC5vcmcsIGxpbnV4LWkyY0B2Z2Vy
Lmtlcm5lbC5vcmcsIGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcKPiDkuLvpopg6IFtQQVRD
SF0gaTJjOiBxdXA6IEFkZCBtaXNzaW5nIHVud2luZCBnb3RvIGluIHF1cF9pMmNfcHJvYmUoKQo+
IAo+IFNtYXRjaCBXYXJuczoKPiAJZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1xdXAuYzoxNzg0IHF1
cF9pMmNfcHJvYmUoKQo+IAl3YXJuOiBtaXNzaW5nIHVud2luZCBnb3RvPwo+IAo+IFRoZSBnb3Rv
IGxhYmVsICJmYWlsX3J1bnRpbWUiIGFuZCAiZmFpbCIgd2lsbCBkaXNhYmxlIHF1cC0+cGNsaywg
Cj4gYnV0IGhlcmUgcXVwLT5wY2xrIGZhaWxlZCB0byBvYnRhaW4sIGluIG9yZGVyIHRvIGJlIGNv
bnNpc3RlbnQsIAo+IGNoYW5nZSB0aGUgZGlyZWN0IHJldHVybiB0byBnb3RvIGxhYmVsICJmYWls
X2RtYSIuCj4gCj4gRml4ZXM6IDEwYzVhODQyNTk2OCAoImkyYzogcXVwOiBOZXcgYnVzIGRyaXZl
ciBmb3IgdGhlIFF1YWxjb21tIFFVUCBJMkMgY29udHJvbGxlciIpCj4gRml4ZXM6IDUxNWRhNzQ2
OTgzYiAoImkyYzogcXVwOiBhZGQgQUNQSSBzdXBwb3J0IikKPiBTaWduZWQtb2ZmLWJ5OiBTaHVh
aSBKaWFuZyA8ZDIwMjE4MDU5NkBodXN0LmVkdS5jbj4KPiBSZXZpZXdlZC1ieTogRG9uZ2xpYW5n
IE11IDxkem05MUBodXN0LmVkdS5jbj4KPiAtLS0KPiBUaGUgaXNzdWUgaXMgZm91bmQgYnkgc3Rh
dGljIGFuYWx5c2lzIGFuZCByZW1haW5zIHVudGVzdGVkLgo+IC0tLQo+ICBkcml2ZXJzL2kyYy9i
dXNzZXMvaTJjLXF1cC5jIHwgMjEgKysrKysrKysrKysrKystLS0tLS0tCj4gIDEgZmlsZSBjaGFu
Z2VkLCAxNCBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2kyYy9idXNzZXMvaTJjLXF1cC5jIGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1xdXAu
Ywo+IGluZGV4IDJlMTUzZjJmNzFiNi4uNzg2ODIzODhlMDJlIDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvaTJjL2J1c3Nlcy9pMmMtcXVwLmMKPiArKysgYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLXF1
cC5jCj4gQEAgLTE3NTIsMTYgKzE3NTIsMjEgQEAgc3RhdGljIGludCBxdXBfaTJjX3Byb2JlKHN0
cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gIAlpZiAoIWNsa19mcmVxIHx8IGNsa19mcmVx
ID4gSTJDX01BWF9GQVNUX01PREVfUExVU19GUkVRKSB7Cj4gIAkJZGV2X2VycihxdXAtPmRldiwg
ImNsb2NrIGZyZXF1ZW5jeSBub3Qgc3VwcG9ydGVkICVkXG4iLAo+ICAJCQljbGtfZnJlcSk7Cj4g
LQkJcmV0dXJuIC1FSU5WQUw7Cj4gKwkJcmV0ID0gLUVJTlZBTDsKPiArCQlnb3RvIGZhaWxfZG1h
Owo+ICAJfQo+ICAKPiAgCXF1cC0+YmFzZSA9IGRldm1fcGxhdGZvcm1faW9yZW1hcF9yZXNvdXJj
ZShwZGV2LCAwKTsKPiAtCWlmIChJU19FUlIocXVwLT5iYXNlKSkKPiAtCQlyZXR1cm4gUFRSX0VS
UihxdXAtPmJhc2UpOwo+ICsJaWYgKElTX0VSUihxdXAtPmJhc2UpKSB7Cj4gKwkJcmV0ID0gUFRS
X0VSUihxdXAtPmJhc2UpOwo+ICsJCWdvdG8gZmFpbF9kbWE7Cj4gKwl9Cj4gIAo+ICAJcXVwLT5p
cnEgPSBwbGF0Zm9ybV9nZXRfaXJxKHBkZXYsIDApOwo+IC0JaWYgKHF1cC0+aXJxIDwgMCkKPiAt
CQlyZXR1cm4gcXVwLT5pcnE7Cj4gKwlpZiAocXVwLT5pcnEgPCAwKSB7Cj4gKwkJcmV0ID0gcXVw
LT5pcnE7Cj4gKwkJZ290byBmYWlsX2RtYTsKPiArCX0KPiAgCj4gIAlpZiAoaGFzX2FjcGlfY29t
cGFuaW9uKHF1cC0+ZGV2KSkgewo+ICAJCXJldCA9IGRldmljZV9wcm9wZXJ0eV9yZWFkX3UzMihx
dXAtPmRldiwKPiBAQCAtMTc3NSwxMyArMTc4MCwxNSBAQCBzdGF0aWMgaW50IHF1cF9pMmNfcHJv
YmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgCQlxdXAtPmNsayA9IGRldm1fY2xr
X2dldChxdXAtPmRldiwgImNvcmUiKTsKPiAgCQlpZiAoSVNfRVJSKHF1cC0+Y2xrKSkgewo+ICAJ
CQlkZXZfZXJyKHF1cC0+ZGV2LCAiQ291bGQgbm90IGdldCBjb3JlIGNsb2NrXG4iKTsKPiAtCQkJ
cmV0dXJuIFBUUl9FUlIocXVwLT5jbGspOwo+ICsJCQlyZXQgPSBQVFJfRVJSKHF1cC0+Y2xrKTsK
PiArCQkJZ290byBmYWlsX2RtYTsKPiAgCQl9Cj4gIAo+ICAJCXF1cC0+cGNsayA9IGRldm1fY2xr
X2dldChxdXAtPmRldiwgImlmYWNlIik7Cj4gIAkJaWYgKElTX0VSUihxdXAtPnBjbGspKSB7Cj4g
IAkJCWRldl9lcnIocXVwLT5kZXYsICJDb3VsZCBub3QgZ2V0IGlmYWNlIGNsb2NrXG4iKTsKPiAt
CQkJcmV0dXJuIFBUUl9FUlIocXVwLT5wY2xrKTsKPiArCQkJcmV0ID0gUFRSX0VSUihxdXAtPnBj
bGspOwo+ICsJCQlnb3RvIGZhaWxfZG1hOwo+ICAJCX0KPiAgCQlxdXBfaTJjX2VuYWJsZV9jbG9j
a3MocXVwKTsKPiAgCQlzcmNfY2xrX2ZyZXEgPSBjbGtfZ2V0X3JhdGUocXVwLT5jbGspOwo+IC0t
IAo+IDIuMjUuMQoKcGluZz8g
